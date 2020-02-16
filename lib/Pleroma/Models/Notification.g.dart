// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    account: json['account'] == null
        ? null
        : PleromaAccount.fromJson(json['account'] as Map<String, dynamic>),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    id: json['id'] as String,
    type: json['type'] as String,
    status: json['status'] == null
        ? null
        : PleromaStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'account': instance.account,
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
    };
