import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_push_loader_model.freezed.dart';

@freezed
class NotificationPushLoaderNotification
    with _$NotificationPushLoaderNotification {
  const factory NotificationPushLoaderNotification({
    required INotification notification,
    required NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  }) = _NotificationPushLoaderNotification;
}
