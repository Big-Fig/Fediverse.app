import '../../notification/type/pleroma_api_notification_type_sealed.dart';
import '../../pleroma_api_model.dart';

abstract class IPleromaApiPushPayload implements IPleromaApiResponse {
  String get notificationId;

  String get notificationType;

  String? get title;

  String? get body;

  String? get icon;
}

extension IPleromaApiPushPayloadNotificationTypeExtension
    on IPleromaApiPushPayload {
  PleromaApiNotificationType get notificationTypeAsPleromaApi =>
      notificationType.toPleromaApiNotificationType();
}
