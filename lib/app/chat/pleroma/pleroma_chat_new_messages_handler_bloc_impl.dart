import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/pleroma/current/pleroma_chat_current_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:unifedi_api/unifedi_api.dart';

class PleromaChatNewMessagesHandlerBloc extends DisposableOwner
    implements IPleromaChatNewMessagesHandlerBloc {
  final IUnifediApiChatService pleromaApiChatService;
  final IPleromaChatRepository chatRepository;
  final IPleromaChatCurrentBloc currentChatBloc;

  PleromaChatNewMessagesHandlerBloc({
    required this.pleromaApiChatService,
    required this.chatRepository,
    required this.currentChatBloc,
  });

  @override
  Future handleNewMessage(IUnifediApiChatMessage chatMessage) async {
    var chatId = chatMessage.chatId;

    // local chat message may not exist
    // when message is first message in new chat
    var chat = await chatRepository.findByRemoteIdInAppType(
      chatId,
    );
    if (chat == null) {
      var remoteChat = await pleromaApiChatService.getChat(
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
        var updatedChat = await pleromaApiChatService.markChatAsRead(
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
  Future handleChatUpdate(IUnifediApiChat chat) async {
    var actualChat = chat;

    // increase only if chat closed now
    var chatId = actualChat.id;
    var isMessageForOpenedChat =
        currentChatBloc.currentChat?.remoteId == chatId;

    if (isMessageForOpenedChat) {
      var lastReadChatMessageId = actualChat.lastMessage?.id;

      if (lastReadChatMessageId != null) {
        actualChat = await pleromaApiChatService.markChatAsRead(
          chatId: chatId,
          lastReadChatMessageId: lastReadChatMessageId,
        );
      }
    }

    return chatRepository.upsertInRemoteType(actualChat);
  }
}
