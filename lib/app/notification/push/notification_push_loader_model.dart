import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/push/notification/simple/handler/simple_notifications_push_handler_model.dart';

class NotificationPushLoaderNotification {
  final INotification notification;
  final SimpleNotificationsPushHandlerMessage simpleNotificationsPushHandlerMessage;
  NotificationPushLoaderNotification({
    required this.notification,
    required this.simpleNotificationsPushHandlerMessage,
  });

  @override
  String toString() {
    return 'NotificationPushLoaderNotification{'
        'pleromaNotification: $notification, '
        'pushHandlerMessage: $simpleNotificationsPushHandlerMessage'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPushLoaderNotification &&
          runtimeType == other.runtimeType &&
          notification == other.notification &&
          simpleNotificationsPushHandlerMessage == other.simpleNotificationsPushHandlerMessage;
  @override
  int get hashCode => notification.hashCode ^ simpleNotificationsPushHandlerMessage.hashCode;
}
