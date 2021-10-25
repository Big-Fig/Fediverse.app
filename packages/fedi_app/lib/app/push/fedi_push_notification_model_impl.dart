import 'package:fedi_app/app/push/fedi_push_notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'fedi_push_notification_model_impl.freezed.dart';

part 'fedi_push_notification_model_impl.g.dart';

@freezed
class FediPushNotification
    with _$FediPushNotification
    implements IFediPushNotification {
  const factory FediPushNotification({
    required String account,
    @JsonKey(name: 'notification_action') required String? notificationAction,
    @JsonKey(name: 'notification_action_input')
        required String? notificationActionInput,
    @JsonKey(name: 'notification_id') required String notificationId,
    @JsonKey(name: 'notification_type') required String notificationType,
    required String server,
    @JsonKey(name: 'notification')
        required UnifediApiNotification? unifediApiNotification,
  }) = _FediPushNotification;

  factory FediPushNotification.fromJson(Map<String, dynamic> json) =>
      _$FediPushNotificationFromJson(json);
}
