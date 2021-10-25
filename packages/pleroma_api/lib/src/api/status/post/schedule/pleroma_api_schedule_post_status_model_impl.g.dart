// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_schedule_post_status_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiSchedulePostStatusAdapter
    extends TypeAdapter<PleromaApiSchedulePostStatus> {
  @override
  final int typeId = 0;

  @override
  PleromaApiSchedulePostStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiSchedulePostStatus(
      contentType: fields[0] as String?,
      expiresInSeconds: fields[1] as int?,
      inReplyToConversationId: fields[2] as String?,
      inReplyToId: fields[3] as String?,
      language: fields[4] as String?,
      visibility: fields[5] as String,
      mediaIds: (fields[6] as List?)?.cast<String>(),
      poll: fields[7] as PleromaApiPostStatusPoll?,
      preview: fields[8] as bool?,
      sensitive: fields[9] as bool,
      spoilerText: fields[10] as String?,
      status: fields[11] as String?,
      to: (fields[12] as List?)?.cast<String>(),
      scheduledAt: fields[13] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiSchedulePostStatus obj) {
    writer
      ..writeByte(14)
      ..writeByte(2)
      ..write(obj.inReplyToConversationId)
      ..writeByte(7)
      ..write(obj.poll)
      ..writeByte(12)
      ..write(obj.to)
      ..writeByte(8)
      ..write(obj.preview)
      ..writeByte(0)
      ..write(obj.contentType)
      ..writeByte(1)
      ..write(obj.expiresInSeconds)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.mediaIds)
      ..writeByte(9)
      ..write(obj.sensitive)
      ..writeByte(10)
      ..write(obj.spoilerText)
      ..writeByte(5)
      ..write(obj.visibility)
      ..writeByte(4)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.inReplyToId)
      ..writeByte(13)
      ..write(obj.scheduledAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiSchedulePostStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiSchedulePostStatus _$$_PleromaApiSchedulePostStatusFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiSchedulePostStatus(
      contentType: json['content_type'] as String?,
      expiresInSeconds: json['expires_in'] as int?,
      inReplyToConversationId: json['in_reply_to_conversation_id'] as String?,
      inReplyToId: json['in_reply_to_id'] as String?,
      language: json['language'] as String?,
      visibility: json['visibility'] as String,
      mediaIds: (json['media_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      poll: json['poll'] == null
          ? null
          : PleromaApiPostStatusPoll.fromJson(
              json['poll'] as Map<String, dynamic>),
      preview: json['preview'] as bool?,
      sensitive: json['sensitive'] as bool,
      spoilerText: json['spoiler_text'] as String?,
      status: json['status'] as String?,
      to: (json['to'] as List<dynamic>?)?.map((e) => e as String).toList(),
      scheduledAt:
          JsonParseHelper.fromUTCIsoString(json['scheduled_at'] as String),
    );

Map<String, dynamic> _$$_PleromaApiSchedulePostStatusToJson(
    _$_PleromaApiSchedulePostStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content_type', instance.contentType);
  writeNotNull('expires_in', instance.expiresInSeconds);
  writeNotNull('in_reply_to_conversation_id', instance.inReplyToConversationId);
  writeNotNull('in_reply_to_id', instance.inReplyToId);
  writeNotNull('language', instance.language);
  val['visibility'] = instance.visibility;
  writeNotNull('media_ids', instance.mediaIds);
  writeNotNull('poll', instance.poll?.toJson());
  writeNotNull('preview', instance.preview);
  val['sensitive'] = instance.sensitive;
  writeNotNull('spoiler_text', instance.spoilerText);
  writeNotNull('status', instance.status);
  writeNotNull('to', instance.to);
  writeNotNull(
      'scheduled_at', JsonParseHelper.toUTCIsoString(instance.scheduledAt));
  return val;
}
