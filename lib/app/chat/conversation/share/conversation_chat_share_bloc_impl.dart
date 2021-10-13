import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class ConversationChatShareBloc extends ShareToAccountBloc
    implements IConversationChatShareBloc {
  final IConversationChatRepository conversationRepository;
  final IStatusRepository statusRepository;
  final IUnifediApiConversationService unifediApiConversationService;
  final IUnifediApiStatusService unifediApiStatusService;
  final IMyAccountBloc myAccountBloc;
  final IAccountRepository accountRepository;

  ConversationChatShareBloc({
    required this.conversationRepository,
    required this.statusRepository,
    required this.unifediApiConversationService,
    required this.unifediApiStatusService,
    required IUnifediApiAccountService unifediApiAccountService,
    required this.myAccountBloc,
    required this.accountRepository,
  }) : super(
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          unifediApiAccountService: unifediApiAccountService,
        );

  @override
  Future<bool> actuallyShareToAccount(IAccount account) async {
    const pleromaVisibility = UnifediApiVisibility.directValue;

    var targetAccounts = [account];
    var sendDataList = await createSendData(
      to: targetAccounts.map((account) => '@${account.acct}').join(', '),
      visibility: pleromaVisibility,
    );

    var unifediApiStatusList = <IUnifediApiStatus>[];

    for (var postStatus in sendDataList) {
      // todo: send to conversation id
      var unifediApiStatus = await unifediApiStatusService.postStatus(
        idempotencyKey: null,
        postStatus: postStatus,
      );
      unifediApiStatusList.add(unifediApiStatus);
    }

    await statusRepository.upsertAllInRemoteType(
      unifediApiStatusList,
      batchTransaction: null,
    );

    return true;
  }

  Future<List<IUnifediApiPostStatus>> createSendData({
    required String to,
    required UnifediApiVisibility visibility,
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
  Future<List<IUnifediApiAccount>> customRemoteAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    // default exist only for first page
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var pleromaConversations =
        await unifediApiConversationService.getConversations(
      pagination: UnifediApiPagination(
        minId: null,
        limit: limit,
        maxId: null,
      ),
      recipientsIds: null,
    );

    await conversationRepository.upsertAllInRemoteType(
      pleromaConversations,
      batchTransaction: null,
    );

    var unifediApiAccounts = <IUnifediApiAccount>[];

    for (var pleromaConversation in pleromaConversations) {
      var pleromaConversationAccounts = pleromaConversation.accounts;
      unifediApiAccounts.addAll(
        pleromaConversationAccounts.where(
          (unifediApiAccount) {
            var notOwn = unifediApiAccount.id != myAccountBloc.account.remoteId;
            var alreadyAdded = unifediApiAccounts.firstWhereOrNull(
                  (unifediApiAccountsItem) =>
                      unifediApiAccountsItem.id == unifediApiAccount.id,
                ) !=
                null;

            return notOwn && !alreadyAdded;
          },
        ),
      );
    }

    return unifediApiAccounts;
  }
}
