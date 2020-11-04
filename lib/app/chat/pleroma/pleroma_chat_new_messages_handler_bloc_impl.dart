import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/pleroma/current/pleroma_chat_current_bloc.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';

class ChatNewMessagesHandlerBloc extends DisposableOwner
    implements IChatNewMessagesHandlerBloc {
  final IPleromaChatService pleromaChatService;
  final IChatRepository chatRepository;
  final ICurrentChatBloc currentChatBloc;

  ChatNewMessagesHandlerBloc({
    @required this.pleromaChatService,
    @required this.chatRepository,
    @required this.currentChatBloc,
  });

  @override
  Future handleNewMessage(IPleromaChatMessage chatMessage) async {
    var chatId = chatMessage.chatId;

    // local chat message may not exist
    // when message is first message in new chat
    var chat = await chatRepository.findByRemoteId(chatId);
    if (chat == null) {
      var remoteChat = await pleromaChatService.getChat(id: chatId);
      await chatRepository.upsertRemoteChat(remoteChat);
      chat = await chatRepository.findByRemoteId(chatId);
    }
    bool isNew;
    var updatedAt = chat.updatedAt;
    if (updatedAt != null) {
      isNew = chatMessage.createdAt.isAfter(updatedAt);
    } else {
      isNew = true;
    }
    // increase only if chat closed now
    var isMessageForOpenedChat =
        currentChatBloc.currentChat?.remoteId == chatId;

    if (isMessageForOpenedChat) {
      var updatedChat = await pleromaChatService.markChatAsRead(
        chatId: chatId,
        lastReadChatMessageId: chatMessage?.id,
      );
      await chatRepository.upsertRemoteChat(updatedChat);
      // updates updatedAt from backend
    } else {
      if (isNew) {
        await chatRepository.incrementUnreadCount(
            chatRemoteId: chatId, updatedAt: updatedAt);
      }
    }
  }

  @override
  Future handleChatUpdate(PleromaChat chat) async {
    // increase only if chat closed now
    var chatId = chat.id;
    var isMessageForOpenedChat =
        currentChatBloc.currentChat?.remoteId == chatId;

    if (isMessageForOpenedChat) {
      chat = await pleromaChatService.markChatAsRead(
        chatId: chatId,
        lastReadChatMessageId: chat.lastMessage?.id,
      );
    }

    return chatRepository.upsertRemoteChat(chat);
  }
}
