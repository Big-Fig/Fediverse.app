import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository_model.dart';
import 'package:fedi_app/app/chat/unifedi/share/unifedi_chat_share_bloc.dart';
import 'package:fedi_app/app/share/to_account/share_to_account_bloc_impl.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class UnifediChatShareBloc extends ShareToAccountBloc
    implements IUnifediChatShareBloc {
  final IUnifediChatRepository chatRepository;
  final IUnifediChatMessageRepository chatMessageRepository;
  final IUnifediApiChatService unifediApiChatService;

  UnifediChatShareBloc({
    required this.chatRepository,
    required this.chatMessageRepository,
    required this.unifediApiChatService,
  });

  @override
  Future<bool> actuallyShareToAccount(IAccount account) async {
    var messageSendDataList = await createUnifediApiChatMessageSendDataList();

    var targetAccounts = [account];
    List<IUnifediApiChat> unifediChatsByAccounts;
    if (targetAccounts.isNotEmpty) {
      var chatsByAccountsFuture = targetAccounts.map(
        (account) => unifediApiChatService.getOrCreateChatByAccountId(
          accountId: account.remoteId,
        ),
      );

      unifediChatsByAccounts = await Future.wait(chatsByAccountsFuture);
      await chatRepository.upsertAllInRemoteType(
        unifediChatsByAccounts,
        batchTransaction: null,
      );
    } else {
      unifediChatsByAccounts = [];
    }

    var allChatsIds = unifediChatsByAccounts
        .map(
          (unifediChat) => unifediChat.id,
        )
        .toList();

    // todo: think about throttling & sorting
    // perhaps send in sequence instead of parallel
    Iterable<Future<List<IUnifediApiChatMessage>>>
        unifediApiChatMessagesListFuture;
    unifediApiChatMessagesListFuture = allChatsIds.map(
      (chatId) {
        var futures = messageSendDataList.map(
          (messageSendData) => unifediApiChatService.sendMessage(
            chatId: chatId,
            postChatMessage: messageSendData,
            idempotencyKey: null,
          ),
        );

        return Future.wait(futures);
      },
    );

    List<List<IUnifediApiChatMessage>> unifediApiChatMessagesList;
    unifediApiChatMessagesList =
        await Future.wait(unifediApiChatMessagesListFuture);

    var unifediApiChatMessages = <IUnifediApiChatMessage>[];

    // ignore: prefer_foreach
    for (final items in unifediApiChatMessagesList) {
      unifediApiChatMessages.addAll(items);
    }

    await chatMessageRepository.upsertAllInRemoteType(
      unifediApiChatMessages,
      batchTransaction: null,
    );

    return true;
  }

  Future<List<UnifediApiPostChatMessage>>
      createUnifediApiChatMessageSendDataList();

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
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
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
    var unifediChats = await unifediApiChatService.getChats(
      pagination: UnifediApiPagination(
        limit: limit,
        minId: null,
        maxId: null,
      ),
    );

    await chatRepository.upsertAllInRemoteType(
      unifediChats,
      batchTransaction: null,
    );

    return unifediChats
        .map(
          (unifediChat) => unifediChat.account,
        )
        .toList();
  }
}
