// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_announcement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAnnouncementAdapter
    extends TypeAdapter<UnifediApiAnnouncement> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAnnouncement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAnnouncement(
      id: fields[0] as String,
      content: fields[1] as String,
      allDay: fields[2] as bool,
      publishedAt: fields[3] as DateTime,
      updatedAt: fields[4] as DateTime,
      read: fields[5] as bool?,
      reactions: (fields[6] as List?)?.cast<UnifediApiEmojiReaction>(),
      mentions: (fields[7] as List?)?.cast<UnifediApiMention>(),
      statuses: (fields[8] as List?)?.cast<UnifediApiStatus>(),
      tags: (fields[9] as List?)?.cast<UnifediApiTag>(),
      scheduledAt: fields[10] as DateTime?,
      startsAt: fields[11] as DateTime?,
      endsAt: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAnnouncement obj) {
    writer
      ..writeByte(13)
      ..writeByte(6)
      ..write(obj.reactions)
      ..writeByte(7)
      ..write(obj.mentions)
      ..writeByte(8)
      ..write(obj.statuses)
      ..writeByte(9)
      ..write(obj.tags)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.allDay)
      ..writeByte(3)
      ..write(obj.publishedAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.read)
      ..writeByte(10)
      ..write(obj.scheduledAt)
      ..writeByte(11)
      ..write(obj.startsAt)
      ..writeByte(12)
      ..write(obj.endsAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAnnouncementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAnnouncement _$$_UnifediApiAnnouncementFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAnnouncement(
      id: json['id'] as String,
      content: json['content'] as String,
      allDay: json['all_day'] as bool,
      publishedAt: DateTime.parse(json['published_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      read: json['read'] as bool?,
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map((e) =>
              UnifediApiEmojiReaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentions: (json['mentions'] as List<dynamic>?)
          ?.map((e) => UnifediApiMention.fromJson(e as Map<String, dynamic>))
          .toList(),
      statuses: (json['statuses'] as List<dynamic>?)
          ?.map((e) => UnifediApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => UnifediApiTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduledAt: json['scheduled_at'] == null
          ? null
          : DateTime.parse(json['scheduled_at'] as String),
      startsAt: json['starts_at'] == null
          ? null
          : DateTime.parse(json['starts_at'] as String),
      endsAt: json['ends_at'] == null
          ? null
          : DateTime.parse(json['ends_at'] as String),
    );

Map<String, dynamic> _$$_UnifediApiAnnouncementToJson(
    _$_UnifediApiAnnouncement instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'content': instance.content,
    'all_day': instance.allDay,
    'published_at': instance.publishedAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('read', instance.read);
  writeNotNull(
      'reactions', instance.reactions?.map((e) => e.toJson()).toList());
  writeNotNull('mentions', instance.mentions?.map((e) => e.toJson()).toList());
  writeNotNull('statuses', instance.statuses?.map((e) => e.toJson()).toList());
  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  writeNotNull('scheduled_at', instance.scheduledAt?.toIso8601String());
  writeNotNull('starts_at', instance.startsAt?.toIso8601String());
  writeNotNull('ends_at', instance.endsAt?.toIso8601String());
  return val;
}
