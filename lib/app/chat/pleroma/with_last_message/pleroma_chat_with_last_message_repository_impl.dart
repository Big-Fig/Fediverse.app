import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_repository.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class ChatWithLastMessageRepository extends AsyncInitLoadingBloc
    implements IChatWithLastMessageRepository {
  final IChatRepository chatRepository;
  final IChatMessageRepository chatMessageRepository;

  ChatWithLastMessageRepository({
    @required this.chatRepository,
    @required this.chatMessageRepository,
  });

  @override
  Future internalAsyncInit() async {
    // nothing by now
  }

  @override
  Future<IChatWithLastMessage> getChatWithLastMessage({
    @required IChat olderThan,
    @required IChat newerThan,
    @required ChatOrderingTermData orderingTermData,
  }) async {
    var chat = await chatRepository.getChat(
        olderThan: olderThan,
        newerThan: newerThan,
        orderingTermData: orderingTermData);

    return await _createChatWithLastMessage(chat);
  }

  Future<ChatWithLastMessageWrapper> _createChatWithLastMessage(
          DbChatPopulatedWrapper chat) async =>
      ChatWithLastMessageWrapper(
        chat: chat,
        lastChatMessage:
            await chatMessageRepository.getChatLastChatMessage(chat: chat),
      );

  @override
  Stream<IChatWithLastMessage> watchChatWithLastMessage({
    @required IChat olderThan,
    @required IChat newerThan,
    @required ChatOrderingTermData orderingTermData,
  }) =>
      chatRepository
          .watchChat(
              olderThan: olderThan,
              newerThan: newerThan,
              orderingTermData: orderingTermData)
          .asyncMap((chat) => _createChatWithLastMessage(chat));

  @override
  Future<List<IChatWithLastMessage>> getChatsWithLastMessage({
    @required IChat olderThan,
    @required IChat newerThan,
    @required int limit,
    @required int offset,
    @required ChatOrderingTermData orderingTermData,
  }) async {
    var chats = await chatRepository.getChats(
        olderThan: olderThan,
        newerThan: newerThan,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    return await _createChatWithLastMessageList(chats);
  }

  Future<List<ChatWithLastMessageWrapper>> _createChatWithLastMessageList(
      List<DbChatPopulatedWrapper> chats) async {
    var chatLastMessagesMap =
        await chatMessageRepository.getChatsLastChatMessage(chats: chats);
    return chatLastMessagesMap.entries.map((entry) {
      var chat = entry.key;
      var lastChatMessage = entry.value;
      return ChatWithLastMessageWrapper(
          chat: chat, lastChatMessage: lastChatMessage);
    }).toList();
  }

  @override
  Stream<List<IChatWithLastMessage>> watchChatsWithLastMessage({
    @required IChat olderThan,
    @required IChat newerThan,
    @required int limit,
    @required int offset,
    @required ChatOrderingTermData orderingTermData,
  }) {
    return chatRepository
        .watchChats(
            olderThan: olderThan,
            newerThan: newerThan,
            limit: limit,
            offset: offset,
            orderingTermData: orderingTermData)
        .asyncMap((chats) => _createChatWithLastMessageList(chats));
  }
}
