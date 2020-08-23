// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostStatusData _$PostStatusDataFromJson(Map<String, dynamic> json) {
  return PostStatusData(
    subject: json['subject'] as String,
    text: json['text'] as String,
    scheduledAt: json['scheduled_at'] == null
        ? null
        : DateTime.parse(json['scheduled_at'] as String),
    visibility: json['visibility'] as String,
    to: (json['to'] as List)?.map((e) => e as String)?.toList(),
    mediaAttachments: (json['media_attachments'] as List)
        ?.map((e) => e == null
            ? null
            : PleromaMediaAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    poll: json['poll'] == null
        ? null
        : PostStatusPoll.fromJson(json['poll'] as Map<String, dynamic>),
    inReplyToPleromaStatus: json['in_reply_to_status'] == null
        ? null
        : PleromaStatus.fromJson(
            json['in_reply_to_status'] as Map<String, dynamic>),
    inReplyToConversationId: json['in_reply_to_conversation_id'] as String,
    isNsfwSensitiveEnabled: json['is_nsfw_sensitive_enabled'] as bool,
  );
}

Map<String, dynamic> _$PostStatusDataToJson(PostStatusData instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'text': instance.text,
      'scheduled_at': instance.scheduledAt?.toIso8601String(),
      'visibility': instance.visibility,
      'to': instance.to,
      'media_attachments': instance.mediaAttachments,
      'poll': instance.poll,
      'in_reply_to_status': instance.inReplyToPleromaStatus,
      'in_reply_to_conversation_id': instance.inReplyToConversationId,
      'is_nsfw_sensitive_enabled': instance.isNsfwSensitiveEnabled,
    };
