import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc_impl.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fedi/repository/repository_model.dart';

abstract class PleromaChatShareBloc extends ShareToAccountBloc
    implements IPleromaChatShareBloc {
  final IPleromaChatRepository chatRepository;
  final IPleromaChatMessageRepository chatMessageRepository;
  final IUnifediApiChatService pleromaApiChatService;

  PleromaChatShareBloc({
    required this.chatRepository,
    required this.chatMessageRepository,
    required this.pleromaApiChatService,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IUnifediApiAccountService unifediApiAccountService,
  }) : super(
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          unifediApiAccountService: unifediApiAccountService,
        );

  @override
  Future<bool> actuallyShareToAccount(IAccount account) async {
    var messageSendDataList = await createPleromaChatMessageSendDataList();

    var targetAccounts = [account];
    List<IUnifediApiChat> pleromaChatsByAccounts;
    if (targetAccounts.isNotEmpty) {
      var chatsByAccountsFuture = targetAccounts.map(
        (account) => pleromaApiChatService.getOrCreateChatByAccountId(
          accountId: account.remoteId,
        ),
      );

      pleromaChatsByAccounts = await Future.wait(chatsByAccountsFuture);
      await chatRepository.upsertAllInRemoteType(
        pleromaChatsByAccounts,
        batchTransaction: null,
      );
    } else {
      pleromaChatsByAccounts = [];
    }

    var allChatsIds = pleromaChatsByAccounts
        .map(
          (pleromaChat) => pleromaChat.id,
        )
        .toList();

    // todo: think about throttling & sorting
    // perhaps send in sequence instead of parallel
    Iterable<Future<List<IUnifediApiChatMessage>>>
        pleromaChatMessagesListFuture;
    pleromaChatMessagesListFuture = allChatsIds.map(
      (chatId) {
        var futures = messageSendDataList.map(
          (messageSendData) => pleromaApiChatService.sendMessage(
            chatId: chatId,

            data: messageSendData,
          ),
        );

        return Future.wait(futures);
      },
    );

    List<List<IUnifediApiChatMessage>> pleromaChatMessagesList;
    pleromaChatMessagesList = await Future.wait(pleromaChatMessagesListFuture);

    var pleromaChatMessages = <IUnifediApiChatMessage>[];

    pleromaChatMessagesList.forEach(
      (List<IUnifediApiChatMessage> items) {
        pleromaChatMessages.addAll(items);
      },
    );

    await chatMessageRepository.upsertAllInRemoteType(
      pleromaChatMessages,
      batchTransaction: null,
    );

    return true;
  }

  Future<List<UnifediApiPostChatMessage>>
      createPleromaChatMessageSendDataList();

  @override
  Future<List<IAccount>> customLocalAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var chats = await chatRepository.findAllInAppType(
      filters: null,
      pagination: RepositoryPagination(
        limit: limit,
      ),
      orderingTerms: [
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
      ],
    );

    return chats.map((chat) => chat.accounts.first).toList();
  }

  @override
  Future<List<IUnifediApiAccount>> customRemoteAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var pleromaChats = await pleromaApiChatService.getChats(
      pagination: UnifediApiPagination(
        limit: limit,
        minId: null,
        maxId: null,
      ),
    );

    await chatRepository.upsertAllInRemoteType(
      pleromaChats,
      batchTransaction: null,
    );

    return pleromaChats
        .map(
          (pleromaChat) => pleromaChat.account,
        )
        .toList();
  }
}
