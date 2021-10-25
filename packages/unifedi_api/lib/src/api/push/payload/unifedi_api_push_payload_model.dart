import '../../notification/type/unifedi_api_notification_type_sealed.dart';
import '../../unifedi_api_model.dart';

abstract class IUnifediApiPushPayload implements IUnifediApiResponse {
  String get notificationId;

  String get notificationType;

  String? get title;

  String? get body;

  String? get icon;
}

extension IUnifediApiPushPayloadExtension on IUnifediApiPushPayload {
  UnifediApiNotificationType get notificationTypeAsUnifediApi =>
      UnifediApiNotificationType.fromStringValue(notificationType);
}
