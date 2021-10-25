import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/account/repository/account_repository.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi_app/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi_app/app/share/to_account/share_to_account_bloc_impl.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/repository/repository_model.dart';
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
    required this.myAccountBloc,
    required this.accountRepository,
  });

  @override
  Future<bool> actuallyShareToAccount(IAccount account) async {
    const unifediVisibility = UnifediApiVisibility.directValue;

    var targetAccounts = [account];
    var sendDataList = await createSendData(
      to: targetAccounts.map((account) => '@${account.acct}').join(', '),
      visibility: unifediVisibility,
    );

    var unifediApiStatusList = <IUnifediApiStatus>[];

    for (final postStatus in sendDataList) {
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

    for (final conversation in conversations) {
      var conversationAccounts = await accountRepository
          .getConversationAccounts(conversation: conversation);

      accounts.addAll(
        conversationAccounts.where(
          (account) {
            var notOwn = account.remoteId != myAccountBloc.account.remoteId;
            var alreadyExist = accounts.firstWhereOrNull(
                  (accountsItem) => accountsItem.remoteId == account.remoteId,
                ) !=
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
    var unifediConversations =
        await unifediApiConversationService.getConversations(
      pagination: UnifediApiPagination(
        minId: null,
        limit: limit,
        maxId: null,
      ),
      recipientsIds: null,
    );

    await conversationRepository.upsertAllInRemoteType(
      unifediConversations,
      batchTransaction: null,
    );

    var unifediApiAccounts = <IUnifediApiAccount>[];

    for (final unifediConversation in unifediConversations) {
      var unifediConversationAccounts = unifediConversation.accounts;
      unifediApiAccounts.addAll(
        unifediConversationAccounts.where(
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
