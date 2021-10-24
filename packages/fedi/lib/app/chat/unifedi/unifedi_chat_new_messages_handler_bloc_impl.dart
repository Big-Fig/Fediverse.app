import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/unifedi/current/unifedi_chat_current_bloc.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_new_messages_handler_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class UnifediChatNewMessagesHandlerBloc extends DisposableOwner
    implements IUnifediChatNewMessagesHandlerBloc {
  final IUnifediApiChatService unifediApiChatService;
  final IUnifediChatRepository chatRepository;
  final IUnifediChatCurrentBloc currentChatBloc;

  UnifediChatNewMessagesHandlerBloc({
    required this.unifediApiChatService,
    required this.chatRepository,
    required this.currentChatBloc,
  });

  @override
  Future<void> handleNewMessage(IUnifediApiChatMessage chatMessage) async {
    var chatId = chatMessage.chatId;

    // local chat message may not exist
    // when message is first message in new chat
    var chat = await chatRepository.findByRemoteIdInAppType(
      chatId,
    );
    if (chat == null) {
      var remoteChat = await unifediApiChatService.getChat(
        id: chatId,
      );
      // ignore: avoid-ignoring-return-values
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
        var updatedChat = await unifediApiChatService.markChatAsRead(
          chatId: chatId,
          lastReadChatMessageId: chatMessage.id,
        );
        // ignore: avoid-ignoring-return-values
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
  Future<void> handleChatUpdate(IUnifediApiChat chat) async {
    var actualChat = chat;

    // increase only if chat closed now
    var chatId = actualChat.id;
    var isMessageForOpenedChat =
        currentChatBloc.currentChat?.remoteId == chatId;

    if (isMessageForOpenedChat) {
      var lastReadChatMessageId = actualChat.lastMessage?.id;

      if (lastReadChatMessageId != null) {
        actualChat = await unifediApiChatService.markChatAsRead(
          chatId: chatId,
          lastReadChatMessageId: lastReadChatMessageId,
        );
      }
    }

    // ignore: avoid-ignoring-return-values
    await chatRepository.upsertInRemoteType(actualChat);
  }
}
