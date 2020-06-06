import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("notification_push_loader_bloc_impl.dart");

class NotificationPushLoaderBloc extends AsyncInitLoadingBloc
    implements INotificationPushLoaderBloc {
  final AuthInstance currentInstance;
  final IPushHandlerBloc pushHandlerBloc;
  final IPleromaNotificationService pleromaNotificationService;

  final INotificationRepository notificationRepository;
  final IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;

  NotificationPushLoaderBloc({
    @required this.currentInstance,
    @required this.pushHandlerBloc,
    @required this.pleromaNotificationService,
    @required this.notificationRepository,
    @required this.chatNewMessagesHandlerBloc,
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
      String remoteNotificationId = pleromaPushMessage.notificationId;
      var remoteNotification = await pleromaNotificationService.getNotification(
          notificationRemoteId: remoteNotificationId);

      handled = remoteNotification != null;

      _logger.finest(() => "handlePush \n"
          "\t remoteNotification = $remoteNotification");

      if (handled) {
        var all = await notificationRepository.countAll();
        _logger.finest(() => "all ${all}");

        var alreadyExistNotification =
            await notificationRepository.findByRemoteId(remoteNotificationId);

        _logger.finest(() => "handlePush \n"
            "\t remoteNotificationId = $remoteNotificationId \n"
            "\t alreadyExistNotification = $alreadyExistNotification");

        await notificationRepository.upsertRemoteNotification(
            remoteNotification,
            unread: alreadyExistNotification?.unread ?? true);

        // todo: remove temp hack unread should be redesigned
        // Also, we should fetch chat info if chat not exist locally
        var chatMessage = remoteNotification.chatMessage;
        if (chatMessage != null) {
          await chatNewMessagesHandlerBloc.handleNewMessage(chatMessage);
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
