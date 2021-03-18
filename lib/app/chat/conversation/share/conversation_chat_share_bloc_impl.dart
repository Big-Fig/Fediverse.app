import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc_impl.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/status/auth/pleroma_auth_status_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/repository/repository_model.dart';

abstract class ConversationChatShareBloc extends ShareToAccountBloc
    implements IConversationChatShareBloc {
  final IConversationChatRepository conversationRepository;
  final IStatusRepository statusRepository;
  final IPleromaConversationService pleromaConversationService;
  final IPleromaAuthStatusService pleromaAuthStatusService;
  final IMyAccountBloc myAccountBloc;
  final IAccountRepository accountRepository;

  String? get message {
    String? message = shareMessageInputBloc.messageField.currentValue;

    if (message?.isNotEmpty != true) {
      message = null;
    }

    return message;
  }

  @override
  IShareMessageInputBloc shareMessageInputBloc = ShareMessageInputBloc();

  ConversationChatShareBloc({
    required this.conversationRepository,
    required this.statusRepository,
    required this.pleromaConversationService,
    required this.pleromaAuthStatusService,
    required IPleromaAccountService pleromaAccountService,
    required this.myAccountBloc,
    required this.accountRepository,
  }) : super(
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          pleromaAccountService: pleromaAccountService,
        ) {
    addDisposable(disposable: shareMessageInputBloc);
  }

  @override
  Future<bool> actuallyShareToAccount(IAccount account) async {
    final pleromaVisibility = PleromaVisibility.direct;

    var targetAccounts = [account];
    var sendData = createSendData(
        to: "${targetAccounts.map((account) => "@${account.acct}").join(", ")}",
        visibility: pleromaVisibility,
      );
    var accountsPleromaStatus = await pleromaAuthStatusService.postStatus(
      data: sendData,
    );

    await statusRepository.upsertRemoteStatus(
      accountsPleromaStatus,
      listRemoteId: null,
      conversationRemoteId: null,
    );

    return true;
  }

  IPleromaPostStatus createSendData({
    required String to,
    required PleromaVisibility visibility,
  });

  @override
  Future<List<IAccount>> customLocalAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    // default exist only for first page
    if (newerThan != null || olderThan != null) {
      return [];
    }

    var conversations = await conversationRepository.getConversations(
      pagination: RepositoryPagination<IConversationChat>(
        limit: limit,
      ),
      orderingTermData: ConversationChatOrderingTermData.updatedAtDesc,
      filters: null,
    );

    var accounts = <IAccount>[];

    for (var conversation in conversations) {
      var conversationAccounts = await accountRepository
          .getConversationAccounts(conversation: conversation);

      accounts.addAll(
        conversationAccounts.where(
          (account) {
            var notOwn = account.remoteId != myAccountBloc.account.remoteId;
            var alreadyExist = accounts.firstWhereOrNull((accountsItem) =>
                    accountsItem.remoteId == account.remoteId) !=
                null;
            return notOwn && !alreadyExist;
          },
        ),
      );
    }

    return accounts;
  }

  @override
  Future<List<IPleromaAccount>> customRemoteAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    // default exist only for first page
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var pleromaConversations =
        await pleromaConversationService.getConversations(
      pagination: PleromaPaginationRequest(
        limit: limit,
      ),
    );

    await conversationRepository
        .upsertRemoteConversations(pleromaConversations);

    var pleromaAccounts = <IPleromaAccount>[];

    for (var pleromaConversation in pleromaConversations) {
      var pleromaConversationAccounts = pleromaConversation.accounts;
      pleromaAccounts.addAll(
        pleromaConversationAccounts.where(
          (pleromaAccount) {
            var notOwn = pleromaAccount.id != myAccountBloc.account.remoteId;
            var alreadyAdded = pleromaAccounts.firstWhereOrNull(
                    (pleromaAccountsItem) =>
                        pleromaAccountsItem.id == pleromaAccount.id) !=
                null;
            return notOwn && !alreadyAdded;
          },
        ),
      );
    }

    return pleromaAccounts;
  }
}
