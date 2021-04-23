// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_emoji_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaEmojiAdapter extends TypeAdapter<PleromaEmoji> {
  @override
  final int typeId = 6;

  @override
  PleromaEmoji read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaEmoji(
      shortcode: fields[0] as String?,
      url: fields[1] as String?,
      staticUrl: fields[2] as String?,
      visibleInPicker: fields[3] as bool?,
      category: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaEmoji obj) {
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
      other is PleromaEmojiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaCustomEmojiAdapter extends TypeAdapter<PleromaCustomEmoji> {
  @override
  final int typeId = 44;

  @override
  PleromaCustomEmoji read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaCustomEmoji(
      tags: (fields[0] as List?)?.cast<String>(),
      imageUrl: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaCustomEmoji obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tags)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaCustomEmojiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaEmoji _$PleromaEmojiFromJson(Map<String, dynamic> json) {
  return PleromaEmoji(
    shortcode: json['shortcode'] as String?,
    url: json['url'] as String?,
    staticUrl: json['static_url'] as String?,
    visibleInPicker: json['visible_in_picker'] as bool?,
    category: json['category'] as String?,
  );
}

Map<String, dynamic> _$PleromaEmojiToJson(PleromaEmoji instance) =>
    <String, dynamic>{
      'shortcode': instance.shortcode,
      'url': instance.url,
      'static_url': instance.staticUrl,
      'visible_in_picker': instance.visibleInPicker,
      'category': instance.category,
    };

PleromaCustomEmoji _$PleromaCustomEmojiFromJson(Map<String, dynamic> json) {
  return PleromaCustomEmoji(
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    imageUrl: json['image_url'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$PleromaCustomEmojiToJson(PleromaCustomEmoji instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'image_url': instance.imageUrl,
      'name': instance.name,
    };
