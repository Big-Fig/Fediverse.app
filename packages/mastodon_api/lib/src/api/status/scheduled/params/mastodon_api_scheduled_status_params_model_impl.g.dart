// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_scheduled_status_params_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiScheduledStatusParamsAdapter
    extends TypeAdapter<MastodonApiScheduledStatusParams> {
  @override
  final int typeId = 0;

  @override
  MastodonApiScheduledStatusParams read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiScheduledStatusParams(
      text: fields[1] as String?,
      mediaIds: (fields[2] as List?)?.cast<String>(),
      sensitive: fields[3] as bool,
      spoilerText: fields[4] as String?,
      visibility: fields[5] as String,
      language: fields[6] as String?,
      scheduledAt: fields[7] as DateTime?,
      poll: fields[8] as MastodonApiPostStatusPoll?,
      inReplyToId: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiScheduledStatusParams obj) {
    writer
      ..writeByte(9)
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
      ..writeByte(8)
      ..write(obj.poll)
      ..writeByte(10)
      ..write(obj.inReplyToId)
      ..writeByte(6)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiScheduledStatusParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiScheduledStatusParams
    _$$_MastodonApiScheduledStatusParamsFromJson(Map<String, dynamic> json) =>
        _$_MastodonApiScheduledStatusParams(
          text: json['text'] as String?,
          mediaIds: (json['media_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          sensitive: json['sensitive'] as bool,
          spoilerText: json['spoiler_text'] as String?,
          visibility: json['visibility'] as String,
          language: json['language'] as String?,
          scheduledAt: json['scheduled_at'] == null
              ? null
              : DateTime.parse(json['scheduled_at'] as String),
          poll: json['poll'] == null
              ? null
              : MastodonApiPostStatusPoll.fromJson(
                  json['poll'] as Map<String, dynamic>),
          inReplyToId: json['in_reply_to_id'] as String?,
        );

Map<String, dynamic> _$$_MastodonApiScheduledStatusParamsToJson(
    _$_MastodonApiScheduledStatusParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('media_ids', instance.mediaIds);
  val['sensitive'] = instance.sensitive;
  writeNotNull('spoiler_text', instance.spoilerText);
  val['visibility'] = instance.visibility;
  writeNotNull('language', instance.language);
  writeNotNull('scheduled_at', instance.scheduledAt?.toIso8601String());
  writeNotNull('poll', instance.poll?.toJson());
  writeNotNull('in_reply_to_id', instance.inReplyToId);
  return val;
}
