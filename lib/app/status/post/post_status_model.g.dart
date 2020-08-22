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
    visibility:
        _$enumDecodeNullable(_$PleromaVisibilityEnumMap, json['visibility']),
    attachments: (json['attachments'] as List)
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
      'visibility': _$PleromaVisibilityEnumMap[instance.visibility],
      'attachments': instance.attachments,
      'poll': instance.poll,
      'in_reply_to_status': instance.inReplyToPleromaStatus,
      'in_reply_to_conversation_id': instance.inReplyToConversationId,
      'is_nsfw_sensitive_enabled': instance.isNsfwSensitiveEnabled,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PleromaVisibilityEnumMap = {
  PleromaVisibility.PUBLIC: 'PUBLIC',
  PleromaVisibility.UNLISTED: 'UNLISTED',
  PleromaVisibility.DIRECT: 'DIRECT',
  PleromaVisibility.LIST: 'LIST',
  PleromaVisibility.PRIVATE: 'PRIVATE',
};
