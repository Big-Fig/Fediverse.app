// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_scheduled_status_params_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiScheduledStatusParamsAdapter
    extends TypeAdapter<UnifediApiScheduledStatusParams> {
  @override
  final int typeId = 0;

  @override
  UnifediApiScheduledStatusParams read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiScheduledStatusParams(
      expiresInSeconds: fields[0] as int?,
      text: fields[1] as String?,
      mediaIds: (fields[2] as List?)?.cast<String>(),
      sensitive: fields[3] as bool,
      spoilerText: fields[4] as String?,
      visibility: fields[5] as String,
      language: fields[6] as String?,
      scheduledAt: fields[7] as DateTime,
      poll: fields[8] as UnifediApiPostStatusPoll?,
      inReplyToId: fields[10] as String?,
      inReplyToConversationId: fields[12] as String?,
      to: (fields[13] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiScheduledStatusParams obj) {
    writer
      ..writeByte(12)
      ..writeByte(13)
      ..write(obj.to)
      ..writeByte(12)
      ..write(obj.inReplyToConversationId)
      ..writeByte(0)
      ..write(obj.expiresInSeconds)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.mediaIds)
      ..writeByte(3)
      ..write(obj.sensitive)
      ..writeByte(4)
      ..write(obj.spoilerText)
      ..writeByte(5)
      ..write(obj.visibility)
      ..writeByte(7)
      ..write(obj.scheduledAt)
      ..writeByte(10)
      ..write(obj.inReplyToId)
      ..writeByte(6)
      ..write(obj.language)
      ..writeByte(8)
      ..write(obj.poll);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiScheduledStatusParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiScheduledStatusParams _$$_UnifediApiScheduledStatusParamsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiScheduledStatusParams(
      expiresInSeconds: json['expires_in'] as int?,
      text: json['text'] as String?,
      mediaIds: (json['media_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sensitive: json['sensitive'] as bool,
      spoilerText: json['spoiler_text'] as String?,
      visibility: json['visibility'] as String,
      language: json['language'] as String?,
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      poll: json['poll'] == null
          ? null
          : UnifediApiPostStatusPoll.fromJson(
              json['poll'] as Map<String, dynamic>),
      inReplyToId: json['in_reply_to_id'] as String?,
      inReplyToConversationId: json['in_reply_to_conversation_id'] as String?,
      to: (json['to'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_UnifediApiScheduledStatusParamsToJson(
    _$_UnifediApiScheduledStatusParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expires_in', instance.expiresInSeconds);
  writeNotNull('text', instance.text);
  writeNotNull('media_ids', instance.mediaIds);
  val['sensitive'] = instance.sensitive;
  writeNotNull('spoiler_text', instance.spoilerText);
  val['visibility'] = instance.visibility;
  writeNotNull('language', instance.language);
  val['scheduled_at'] = instance.scheduledAt.toIso8601String();
  writeNotNull('poll', instance.poll?.toJson());
  writeNotNull('in_reply_to_id', instance.inReplyToId);
  writeNotNull('in_reply_to_conversation_id', instance.inReplyToConversationId);
  writeNotNull('to', instance.to);
  return val;
}
