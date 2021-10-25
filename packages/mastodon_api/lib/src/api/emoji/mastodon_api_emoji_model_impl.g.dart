// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_emoji_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiEmojiAdapter extends TypeAdapter<MastodonApiEmoji> {
  @override
  final int typeId = 0;

  @override
  MastodonApiEmoji read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiEmoji(
      shortcode: fields[0] as String,
      url: fields[1] as String?,
      staticUrl: fields[2] as String?,
      visibleInPicker: fields[3] as bool?,
      category: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiEmoji obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.shortcode)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.staticUrl)
      ..writeByte(3)
      ..write(obj.visibleInPicker)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiEmojiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiEmoji _$$_MastodonApiEmojiFromJson(Map<String, dynamic> json) =>
    _$_MastodonApiEmoji(
      shortcode: json['shortcode'] as String,
      url: json['url'] as String?,
      staticUrl: json['static_url'] as String?,
      visibleInPicker: json['visible_in_picker'] as bool?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiEmojiToJson(_$_MastodonApiEmoji instance) {
  final val = <String, dynamic>{
    'shortcode': instance.shortcode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('static_url', instance.staticUrl);
  writeNotNull('visible_in_picker', instance.visibleInPicker);
  writeNotNull('category', instance.category);
  return val;
}
