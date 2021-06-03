import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/push/handler/push_handler_model.dart';

class NotificationPushLoaderNotification {
  final INotification notification;
  final PushHandlerMessage pushHandlerMessage;
  NotificationPushLoaderNotification({
    required this.notification,
    required this.pushHandlerMessage,
  });

  @override
  String toString() {
    return 'NotificationPushLoaderNotification{'
        'pleromaNotification: $notification, '
        'pushHandlerMessage: $pushHandlerMessage'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPushLoaderNotification &&
          runtimeType == other.runtimeType &&
          notification == other.notification &&
          pushHandlerMessage == other.pushHandlerMessage;
  @override
  int get hashCode => notification.hashCode ^ pushHandlerMessage.hashCode;
}
