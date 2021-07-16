import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef IPushRealTimeHandler = Future<bool> Function(
  NotificationsPushHandlerMessage notificationsPushHandlerMessage,
);

abstract class INotificationsPushHandlerBloc extends IDisposable {
  static INotificationsPushHandlerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<INotificationsPushHandlerBloc>(context, listen: listen);

  List<NotificationsPushHandlerMessage> loadUnhandledMessagesForInstance(
    AuthInstance instance,
  );

  Future handleInitialMessage();

  Future<bool> markAsHandled(List<NotificationsPushHandlerMessage> messages);

  Future markAsLaunchMessage(NotificationsPushHandlerMessage message);

  void addRealTimeHandler(IPushRealTimeHandler notificationsPushHandler);

  void removeRealTimeHandler(IPushRealTimeHandler notificationsPushHandler);
}
