// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fedi_push_notification_model_impl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FediPushNotification _$$_FediPushNotificationFromJson(
        Map<String, dynamic> json) =>
    _$_FediPushNotification(
      account: json['account'] as String,
      notificationAction: json['notification_action'] as String?,
      notificationActionInput: json['notification_action_input'] as String?,
      notificationId: json['notification_id'] as String,
      notificationType: json['notification_type'] as String,
      server: json['server'] as String,
      unifediApiNotification: json['notification'] == null
          ? null
          : UnifediApiNotification.fromJson(
              json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FediPushNotificationToJson(
    _$_FediPushNotification instance) {
  final val = <String, dynamic>{
    'account': instance.account,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('notification_action', instance.notificationAction);
  writeNotNull('notification_action_input', instance.notificationActionInput);
  val['notification_id'] = instance.notificationId;
  val['notification_type'] = instance.notificationType;
  val['server'] = instance.server;
  writeNotNull('notification', instance.unifediApiNotification?.toJson());
  return val;
}
