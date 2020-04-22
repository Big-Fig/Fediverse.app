// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaNotification _$PleromaNotificationFromJson(Map<String, dynamic> json) {
  return PleromaNotification(
    account: json['account'] == null
        ? null
        : PleromaAccount.fromJson(json['account'] as Map<String, dynamic>),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    id: json['id'] as String,
    type: const MastodonMediaNotificationTypeTypeConverter()
        .fromJson(json['type'] as String),
    status: json['status'] == null
        ? null
        : PleromaStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaNotificationToJson(
        PleromaNotification instance) =>
    <String, dynamic>{
      'account': instance.account,
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'type': const MastodonMediaNotificationTypeTypeConverter()
          .toJson(instance.type),
      'status': instance.status,
    };
