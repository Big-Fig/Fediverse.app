import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';

class NotificationPushLoaderNotification {
  final INotification notification;
  final NotificationsPushHandlerMessage notificationsPushHandlerMessage;
  NotificationPushLoaderNotification({
    required this.notification,
    required this.notificationsPushHandlerMessage,
  });

  @override
  String toString() {
    return 'NotificationPushLoaderNotification{'
        'pleromaNotification: $notification, '
        'notificationsPushHandlerMessage: $notificationsPushHandlerMessage'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPushLoaderNotification &&
          runtimeType == other.runtimeType &&
          notification == other.notification &&
          notificationsPushHandlerMessage ==
              other.notificationsPushHandlerMessage;
  @override
  int get hashCode =>
      notification.hashCode ^ notificationsPushHandlerMessage.hashCode;
}
