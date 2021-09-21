import 'package:easy_dispose/easy_dispose.dart';

import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

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
    UnifediApiAccess instance,
  );

  Future handleInitialMessage();

  Future<bool> markAsHandled(List<NotificationsPushHandlerMessage> messages);

  Future markAsLaunchMessage(NotificationsPushHandlerMessage message);

  void addRealTimeHandler(IPushRealTimeHandler notificationsPushHandler);

  void removeRealTimeHandler(IPushRealTimeHandler notificationsPushHandler);
}
