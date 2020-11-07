import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/repository/pleroma_chat_with_last_message_repository.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class PleromaChatWithLastMessageRepository extends AsyncInitLoadingBloc
    implements IPleromaChatWithLastMessageRepository {
  final IPleromaChatRepository chatRepository;
  final IPleromaChatMessageRepository chatMessageRepository;

  PleromaChatWithLastMessageRepository({
    @required this.chatRepository,
    @required this.chatMessageRepository,
  });

  @override
  Future internalAsyncInit() async {
    // nothing by now
  }

  @override
  Future<IPleromaChatWithLastMessage> getChatWithLastMessage({
    @required IPleromaChat olderThan,
    @required IPleromaChat newerThan,
    @required PleromaChatOrderingTermData orderingTermData,
  }) async {
    var chat = await chatRepository.getChat(
        olderThan: olderThan,
        newerThan: newerThan,
        orderingTermData: orderingTermData);

    return await _createChatWithLastMessage(chat);
  }

  Future<PleromaChatWithLastMessageWrapper> _createChatWithLastMessage(
          DbPleromaChatPopulatedWrapper chat) async =>
      PleromaChatWithLastMessageWrapper(
        chat: chat,
        lastChatMessage:
            await chatMessageRepository.getChatLastChatMessage(chat: chat),
      );

  @override
  Stream<IPleromaChatWithLastMessage> watchChatWithLastMessage({
    @required IPleromaChat olderThan,
    @required IPleromaChat newerThan,
    @required PleromaChatOrderingTermData orderingTermData,
  }) =>
      chatRepository
          .watchChat(
              olderThan: olderThan,
              newerThan: newerThan,
              orderingTermData: orderingTermData)
          .asyncMap((chat) => _createChatWithLastMessage(chat));

  @override
  Future<List<IPleromaChatWithLastMessage>> getChatsWithLastMessage({
    @required IPleromaChat olderThan,
    @required IPleromaChat newerThan,
    @required int limit,
    @required int offset,
    @required PleromaChatOrderingTermData orderingTermData,
  }) async {
    var chats = await chatRepository.getChats(
        olderThan: olderThan,
        newerThan: newerThan,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    return await _createChatWithLastMessageList(chats);
  }

  Future<List<PleromaChatWithLastMessageWrapper>>
      _createChatWithLastMessageList(
          List<DbPleromaChatPopulatedWrapper> chats) async {
    var chatLastMessagesMap =
        await chatMessageRepository.getChatsLastChatMessage(chats: chats);
    return chatLastMessagesMap.entries.map(
      (entry) {
        var chat = entry.key;
        var lastChatMessage = entry.value;
        return PleromaChatWithLastMessageWrapper(
          chat: chat,
          lastChatMessage: lastChatMessage,
        );
      },
    ).toList();
  }

  @override
  Stream<List<IPleromaChatWithLastMessage>> watchChatsWithLastMessage({
    @required IPleromaChat olderThan,
    @required IPleromaChat newerThan,
    @required int limit,
    @required int offset,
    @required PleromaChatOrderingTermData orderingTermData,
  }) {
    return chatRepository
        .watchChats(
            olderThan: olderThan,
            newerThan: newerThan,
            limit: limit,
            offset: offset,
            orderingTermData: orderingTermData)
        .asyncMap(
          (chats) => _createChatWithLastMessageList(
            chats,
          ),
        );
  }
}
