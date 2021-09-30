// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fedi_push_notification_model_impl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FediPushNotification _$FediPushNotificationFromJson(
        Map<String, dynamic> json) =>
    FediPushNotification(
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

Map<String, dynamic> _$FediPushNotificationToJson(
        FediPushNotification instance) =>
    <String, dynamic>{
      'account': instance.account,
      'notification_action': instance.notificationAction,
      'notification_action_input': instance.notificationActionInput,
      'notification_id': instance.notificationId,
      'notification_type': instance.notificationType,
      'server': instance.server,
      'notification': instance.unifediApiNotification?.toJson(),
    };
