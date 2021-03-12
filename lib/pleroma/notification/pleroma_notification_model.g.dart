// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaNotificationPleromaPart _$PleromaNotificationPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaNotificationPleromaPart(
    isSeen: json['is_seen'] as bool,
    isMuted: json['is_muted'] as bool,
  );
}

Map<String, dynamic> _$PleromaNotificationPleromaPartToJson(
        PleromaNotificationPleromaPart instance) =>
    <String, dynamic>{
      'is_seen': instance.isSeen,
      'is_muted': instance.isMuted,
    };

PleromaNotification _$PleromaNotificationFromJson(Map<String, dynamic> json) {
  return PleromaNotification(
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
    chatMessage: json['chat_message'] == null
        ? null
        : PleromaChatMessage.fromJson(
            json['chat_message'] as Map<String, dynamic>),
    emoji: json['emoji'] as String,
    pleroma: json['pleroma'] == null
        ? null
        : PleromaNotificationPleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
    report: json['report'] == null
        ? null
        : PleromaAccountReport.fromJson(json['report'] as Map<String, dynamic>),
    target: json['target'] == null
        ? null
        : PleromaAccount.fromJson(json['target'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaNotificationToJson(
        PleromaNotification instance) =>
    <String, dynamic>{
      'account': instance.account?.toJson(),
      'target': instance.target?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'type': instance.type,
      'status': instance.status?.toJson(),
      'emoji': instance.emoji,
      'pleroma': instance.pleroma?.toJson(),
      'chat_message': instance.chatMessage?.toJson(),
      'report': instance.report?.toJson(),
    };
