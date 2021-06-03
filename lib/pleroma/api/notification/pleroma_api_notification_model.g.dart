// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiNotificationPleromaPart _$PleromaApiNotificationPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaApiNotificationPleromaPart(
    isSeen: json['is_seen'] as bool?,
    isMuted: json['is_muted'] as bool?,
  );
}

Map<String, dynamic> _$PleromaApiNotificationPleromaPartToJson(
        PleromaApiNotificationPleromaPart instance) =>
    <String, dynamic>{
      'is_seen': instance.isSeen,
      'is_muted': instance.isMuted,
    };

PleromaApiNotification _$PleromaApiNotificationFromJson(
    Map<String, dynamic> json) {
  return PleromaApiNotification(
    account: json['account'] == null
        ? null
        : PleromaApiAccount.fromJson(json['account'] as Map<String, dynamic>),
    createdAt: DateTime.parse(json['created_at'] as String),
    id: json['id'] as String,
    type: json['type'] as String,
    status: json['status'] == null
        ? null
        : PleromaApiStatus.fromJson(json['status'] as Map<String, dynamic>),
    chatMessage: json['chat_message'] == null
        ? null
        : PleromaApiChatMessage.fromJson(
            json['chat_message'] as Map<String, dynamic>),
    emoji: json['emoji'] as String?,
    pleroma: json['pleroma'] == null
        ? null
        : PleromaApiNotificationPleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
    report: json['report'] == null
        ? null
        : PleromaApiAccountReport.fromJson(
            json['report'] as Map<String, dynamic>),
    target: json['target'] == null
        ? null
        : PleromaApiAccount.fromJson(json['target'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiNotificationToJson(
        PleromaApiNotification instance) =>
    <String, dynamic>{
      'account': instance.account?.toJson(),
      'target': instance.target?.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'type': instance.type,
      'status': instance.status?.toJson(),
      'emoji': instance.emoji,
      'pleroma': instance.pleroma?.toJson(),
      'chat_message': instance.chatMessage?.toJson(),
      'report': instance.report?.toJson(),
    };
