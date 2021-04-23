import 'package:fedi/app/chat/pleroma/current/pleroma_chat_current_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';

class PleromaChatNewMessagesHandlerBloc extends DisposableOwner
    implements IPleromaChatNewMessagesHandlerBloc {
  final IPleromaChatService pleromaChatService;
  final IPleromaChatRepository chatRepository;
  final IPleromaChatCurrentBloc currentChatBloc;

  PleromaChatNewMessagesHandlerBloc({
    required this.pleromaChatService,
    required this.chatRepository,
    required this.currentChatBloc,
  });

  @override
  Future handleNewMessage(IPleromaChatMessage chatMessage) async {
    var chatId = chatMessage.chatId;

    // local chat message may not exist
    // when message is first message in new chat
    var chat = await chatRepository.findByRemoteIdInAppType(
      chatId,
    );
    if (chat == null) {
      var remoteChat = await pleromaChatService.getChat(
        id: chatId,
      );
      await chatRepository.upsertInRemoteType(
        remoteChat,
      );
      chat = await chatRepository.findByRemoteIdInAppType(
        chatId,
      );
    }
    if (chat != null) {
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
          lastReadChatMessageId: chatMessage.id,
        );
        await chatRepository.upsertInRemoteType(updatedChat);
        // updates updatedAt from backend
      } else {
        if (isNew) {
          await chatRepository.incrementUnreadCount(
            chatRemoteId: chatId,
            updatedAt: updatedAt ?? DateTime.now(),
          );
        }
      }
    }
  }

  @override
  Future handleChatUpdate(IPleromaChat chat) async {
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

    return chatRepository.upsertInRemoteType(chat);
  }
}
