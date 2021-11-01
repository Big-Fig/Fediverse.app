import 'package:fedi_app/app/push/fedi_push_notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'fedi_push_notification_model_impl.freezed.dart';

part 'fedi_push_notification_model_impl.g.dart';

// ignore_for_file: no-magic-number

@freezed
@HiveType(typeId: -32 + 118)
class FediPushNotification
    with _$FediPushNotification
    implements IFediPushNotification {
  const factory FediPushNotification({
    @HiveField(0) required String account,
    @HiveField(1)
    @JsonKey(name: 'notification_action')
        required String? notificationAction,
    @HiveField(2)
    @JsonKey(name: 'notification_action_input')
        required String? notificationActionInput,
    @HiveField(3)
    @JsonKey(name: 'notification_id')
        required String notificationId,
    @HiveField(4)
    @JsonKey(name: 'notification_type')
        required String notificationType,
    @HiveField(5) required String server,
    @HiveField(6)
    @JsonKey(name: 'notification')
        required UnifediApiNotification? unifediApiNotification,
  }) = _FediPushNotification;

  factory FediPushNotification.fromJson(Map<String, dynamic> json) =>
      _$FediPushNotificationFromJson(json);
}
