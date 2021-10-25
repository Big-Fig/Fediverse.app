// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_announcement_emoji_reaction_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAnnouncementEmojiReactionAdapter
    extends TypeAdapter<PleromaApiAnnouncementEmojiReaction> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAnnouncementEmojiReaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAnnouncementEmojiReaction(
      name: fields[0] as String,
      count: fields[1] as int,
      me: fields[2] as bool,
      url: fields[3] as String?,
      staticUrl: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAnnouncementEmojiReaction obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.me)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.staticUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAnnouncementEmojiReactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAnnouncementEmojiReaction
    _$$_PleromaApiAnnouncementEmojiReactionFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiAnnouncementEmojiReaction(
          name: json['name'] as String,
          count: json['count'] as int,
          me: json['me'] as bool,
          url: json['url'] as String?,
          staticUrl: json['static_url'] as String?,
        );

Map<String, dynamic> _$$_PleromaApiAnnouncementEmojiReactionToJson(
    _$_PleromaApiAnnouncementEmojiReaction instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'count': instance.count,
    'me': instance.me,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('static_url', instance.staticUrl);
  return val;
}
