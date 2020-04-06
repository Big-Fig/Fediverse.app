import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:flutter/widgets.dart';

abstract class NotificationPushLoaderBloc extends AsyncInitLoadingBloc
    implements INotificationPushLoaderBloc {
  final AuthInstance currentInstance;
  final IPushHandlerBloc pushHandlerBloc;
  final IPleromaNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;

  NotificationPushLoaderBloc({
    @required this.currentInstance,
    @required this.pushHandlerBloc,
    @required this.pleromaNotificationService,
    @required this.notificationRepository,
  }) {
    IPushRealTimeHandler pushHandler;
    pushHandlerBloc.addRealTimeHandler(pushHandler);
    addDisposable(disposable: CustomDisposable(() {
      pushHandlerBloc.removeRealTimeHandler(pushHandler);
    }));
  }

  @override
  Future performAsyncInit() async {
    await super.performAsyncInit();

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

  Future<bool> handlePush(PleromaPushMessage pleromaPushMessage) async {
    var isForCurrentInstance = currentInstance.isInstanceWithHostAndAcct
      (host: pleromaPushMessage.server, acct: pleromaPushMessage.account);
    bool handled;
    if (isForCurrentInstance) {
      var remoteNotification = await pleromaNotificationService.getNotification(
          notificationRemoteId: pleromaPushMessage.notificationId);

      handled = remoteNotification != null;
      if (handled) {
        await notificationRepository
            .upsertRemoteNotification(remoteNotification, unread: true);
      }
    } else {
      handled = false;
    }

    return handled;
  }
}
