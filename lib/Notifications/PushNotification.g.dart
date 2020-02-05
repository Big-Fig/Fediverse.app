// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PushNotification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) {
  return PushNotification(
    notificationType: json['notification_type'] as String,
    notificationId: json['notification_id'] as int,
    server: json['server'] as String,
    account: json['account'] as String,
  );
}

Map<String, dynamic> _$PushNotificationToJson(PushNotification instance) =>
    <String, dynamic>{
      'notification_type': instance.notificationType,
      'notification_id': instance.notificationId,
      'server': instance.server,
      'account': instance.account,
    };
