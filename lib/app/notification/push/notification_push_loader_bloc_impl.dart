import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/current/current_chat_bloc.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("notification_push_loader_bloc_impl.dart");

class NotificationPushLoaderBloc extends AsyncInitLoadingBloc
    implements INotificationPushLoaderBloc {
  final AuthInstance currentInstance;
  final IPushHandlerBloc pushHandlerBloc;
  final IPleromaNotificationService pleromaNotificationService;
  final IPleromaChatService pleromaChatService;
  final INotificationRepository notificationRepository;
  final IChatRepository chatRepository;
  final ICurrentChatBloc currentChatBloc;

  NotificationPushLoaderBloc({
    @required this.currentInstance,
    @required this.pushHandlerBloc,
    @required this.pleromaNotificationService,
    @required this.pleromaChatService,
    @required this.notificationRepository,
    @required this.chatRepository,
    @required this.currentChatBloc,
  }) {
    pushHandlerBloc.addRealTimeHandler(handlePush);
    addDisposable(disposable: CustomDisposable(() {
      pushHandlerBloc.removeRealTimeHandler(handlePush);
    }));
  }

  Future<bool> handlePush(PleromaPushMessage pleromaPushMessage) async {
    var isForCurrentInstance = currentInstance.isInstanceWithHostAndAcct(
        host: pleromaPushMessage.server, acct: pleromaPushMessage.account);

    _logger.finest(() => "handlePush \n"
        "\t isForCurrentInstance = $isForCurrentInstance"
        "\t pleromaPushMessage = $pleromaPushMessage");
    bool handled;
    if (isForCurrentInstance) {
      var remoteNotification = await pleromaNotificationService.getNotification(
          notificationRemoteId: pleromaPushMessage.notificationId);

      handled = remoteNotification != null;

      _logger.finest(() => "handlePush \n"
          "\t remoteNotification = $remoteNotification");

      if (handled) {
        await notificationRepository
            .upsertRemoteNotification(remoteNotification, unread: true);

        // todo: remove temp hack unread should be redesigned
        // Also, we should fetch chat info if chat not exist locally
        var chatMessage = remoteNotification.chatMessage;
        if (chatMessage != null) {
          var chatId = chatMessage.chatId;

          // local chat message may not exist
          // when message is first message in new chat
          var chat = await chatRepository.findByRemoteId(chatId);
          if(chat == null) {
            var remoteChat = await pleromaChatService.getChat(id: chatId);
            await chatRepository.upsertRemoteChat(remoteChat);
          }

          // increase only if chat closed now
          var isMessageForOpenedChat =
              currentChatBloc.currentChat?.remoteId == chatId;
          if (isMessageForOpenedChat) {
            var updatedChat =
                await pleromaChatService.markChatAsRead(chatId: chatId);
            await chatRepository.upsertRemoteChat(updatedChat);
          } else {
            await chatRepository.incrementUnreadCount(chatRemoteId: chatId);
          }
        }
      }
    } else {
      handled = false;
    }

    return handled;
  }

  @override
  Future internalAsyncInit() async {
    var unhandledMessages =
        pushHandlerBloc.loadUnhandledMessagesForInstance(currentInstance);

    var handledMessages = [];

    for (var message in unhandledMessages) {
      var success = await handlePush(message);
      if (success) {
        handledMessages.add(message);
      }
    }

    await pushHandlerBloc.markAsHandled(handledMessages);
  }
}
