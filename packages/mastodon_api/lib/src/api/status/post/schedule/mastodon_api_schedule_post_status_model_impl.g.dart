// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_schedule_post_status_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiSchedulePostStatusAdapter
    extends TypeAdapter<MastodonApiSchedulePostStatus> {
  @override
  final int typeId = 0;

  @override
  MastodonApiSchedulePostStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiSchedulePostStatus(
      inReplyToId: fields[3] as String?,
      language: fields[4] as String?,
      visibility: fields[5] as String,
      mediaIds: (fields[6] as List?)?.cast<String>(),
      poll: fields[7] as MastodonApiPostStatusPoll?,
      sensitive: fields[9] as bool,
      spoilerText: fields[10] as String?,
      status: fields[11] as String?,
      scheduledAt: fields[13] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiSchedulePostStatus obj) {
    writer
      ..writeByte(9)
      ..writeByte(13)
      ..write(obj.scheduledAt)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.mediaIds)
      ..writeByte(7)
      ..write(obj.poll)
      ..writeByte(9)
      ..write(obj.sensitive)
      ..writeByte(10)
      ..write(obj.spoilerText)
      ..writeByte(5)
      ..write(obj.visibility)
      ..writeByte(4)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.inReplyToId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiSchedulePostStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiSchedulePostStatus _$$_MastodonApiSchedulePostStatusFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiSchedulePostStatus(
      inReplyToId: json['in_reply_to_id'] as String?,
      language: json['language'] as String?,
      visibility: json['visibility'] as String,
      mediaIds: (json['media_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      poll: json['poll'] == null
          ? null
          : MastodonApiPostStatusPoll.fromJson(
              json['poll'] as Map<String, dynamic>),
      sensitive: json['sensitive'] as bool,
      spoilerText: json['spoiler_text'] as String?,
      status: json['status'] as String?,
      scheduledAt:
          JsonParseHelper.fromUTCIsoString(json['scheduled_at'] as String),
    );

Map<String, dynamic> _$$_MastodonApiSchedulePostStatusToJson(
    _$_MastodonApiSchedulePostStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('in_reply_to_id', instance.inReplyToId);
  writeNotNull('language', instance.language);
  val['visibility'] = instance.visibility;
  writeNotNull('media_ids', instance.mediaIds);
  writeNotNull('poll', instance.poll?.toJson());
  val['sensitive'] = instance.sensitive;
  writeNotNull('spoiler_text', instance.spoilerText);
  writeNotNull('status', instance.status);
  writeNotNull(
      'scheduled_at', JsonParseHelper.toUTCIsoString(instance.scheduledAt));
  return val;
}
