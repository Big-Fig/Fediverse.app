// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_emoji_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiEmojiAdapter extends TypeAdapter<UnifediApiEmoji> {
  @override
  final int typeId = 0;

  @override
  UnifediApiEmoji read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiEmoji(
      name: fields[0] as String,
      url: fields[1] as String?,
      staticUrl: fields[2] as String?,
      visibleInPicker: fields[3] as bool?,
      tags: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiEmoji obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.staticUrl)
      ..writeByte(3)
      ..write(obj.visibleInPicker)
      ..writeByte(4)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiEmojiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiEmoji _$$_UnifediApiEmojiFromJson(Map<String, dynamic> json) =>
    _$_UnifediApiEmoji(
      name: json['name'] as String,
      url: json['url'] as String?,
      staticUrl: json['static_url'] as String?,
      visibleInPicker: json['visible_in_picker'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_UnifediApiEmojiToJson(_$_UnifediApiEmoji instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('static_url', instance.staticUrl);
  writeNotNull('visible_in_picker', instance.visibleInPicker);
  writeNotNull('tags', instance.tags);
  return val;
}
