import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:fedi/repository/repository_model.dart';

abstract class ConversationChatShareBloc extends ShareToAccountBloc
    implements IConversationChatShareBloc {
  final IConversationChatRepository conversationRepository;
  final IStatusRepository statusRepository;
  final IPleromaApiConversationService pleromaApiConversationService;
  final IPleromaApiAuthStatusService pleromaApiAuthStatusService;
  final IMyAccountBloc myAccountBloc;
  final IAccountRepository accountRepository;

  ConversationChatShareBloc({
    required this.conversationRepository,
    required this.statusRepository,
    required this.pleromaApiConversationService,
    required this.pleromaApiAuthStatusService,
    required IPleromaApiAccountService pleromaAccountService,
    required this.myAccountBloc,
    required this.accountRepository,
  }) : super(
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          pleromaAccountService: pleromaAccountService,
        );

  @override
  Future<bool> actuallyShareToAccount(IAccount account) async {
    const pleromaVisibility = PleromaApiVisibility.direct;

    var targetAccounts = [account];
    var sendDataList = await createSendData(
      to: '${targetAccounts.map((account) => '@${account.acct}').join(', ')}',
      visibility: pleromaVisibility,
    );

    var pleromaStatusList = <IPleromaApiStatus>[];

    for (var sendData in sendDataList) {
      // todo: send to conversation id
      var pleromaStatus = await pleromaApiAuthStatusService.postStatus(
        data: sendData,
      );
      pleromaStatusList.add(pleromaStatus);
    }

    await statusRepository.upsertAllInRemoteType(
      pleromaStatusList,
      batchTransaction: null,
    );

    return true;
  }

  Future<List<IPleromaApiPostStatus>> createSendData({
    required String to,
    required PleromaApiVisibility visibility,
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

    var conversations = await conversationRepository.findAllInAppType(
      pagination: RepositoryPagination(
        limit: limit,
      ),
      filters: null,
      orderingTerms: [
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
      ],
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
  Future<List<IPleromaApiAccount>> customRemoteAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    // default exist only for first page
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var pleromaConversations =
        await pleromaApiConversationService.getConversations(
      pagination: PleromaApiPaginationRequest(
        limit: limit,
      ),
    );

    await conversationRepository.upsertAllInRemoteType(
      pleromaConversations,
      batchTransaction: null,
    );

    var pleromaAccounts = <IPleromaApiAccount>[];

    for (var pleromaConversation in pleromaConversations) {
      var pleromaConversationAccounts = pleromaConversation.accounts;
      pleromaAccounts.addAll(
        pleromaConversationAccounts.where(
          (pleromaAccount) {
            var notOwn = pleromaAccount.id != myAccountBloc.account.remoteId;
            var alreadyAdded = pleromaAccounts.firstWhereOrNull(
                  (pleromaAccountsItem) =>
                      pleromaAccountsItem.id == pleromaAccount.id,
                ) !=
                null;

            return notOwn && !alreadyAdded;
          },
        ),
      );
    }

    return pleromaAccounts;
  }
}
