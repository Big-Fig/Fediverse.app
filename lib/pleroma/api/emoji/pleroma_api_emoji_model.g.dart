// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_emoji_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiEmojiAdapter extends TypeAdapter<PleromaApiEmoji> {
  @override
  final int typeId = 6;

  @override
  PleromaApiEmoji read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiEmoji(
      shortcode: fields[0] as String?,
      url: fields[1] as String?,
      staticUrl: fields[2] as String?,
      visibleInPicker: fields[3] as bool?,
      category: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiEmoji obj) {
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
      other is PleromaApiEmojiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiCustomEmojiAdapter extends TypeAdapter<PleromaApiCustomEmoji> {
  @override
  final int typeId = 44;

  @override
  PleromaApiCustomEmoji read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiCustomEmoji(
      tags: (fields[0] as List?)?.cast<String>(),
      imageUrl: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiCustomEmoji obj) {
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
      other is PleromaApiCustomEmojiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiEmoji _$PleromaApiEmojiFromJson(Map<String, dynamic> json) {
  return PleromaApiEmoji(
    shortcode: json['shortcode'] as String?,
    url: json['url'] as String?,
    staticUrl: json['static_url'] as String?,
    visibleInPicker: json['visible_in_picker'] as bool?,
    category: json['category'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiEmojiToJson(PleromaApiEmoji instance) =>
    <String, dynamic>{
      'shortcode': instance.shortcode,
      'url': instance.url,
      'static_url': instance.staticUrl,
      'visible_in_picker': instance.visibleInPicker,
      'category': instance.category,
    };

PleromaApiCustomEmoji _$PleromaApiCustomEmojiFromJson(
    Map<String, dynamic> json) {
  return PleromaApiCustomEmoji(
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    imageUrl: json['image_url'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$PleromaApiCustomEmojiToJson(
        PleromaApiCustomEmoji instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'image_url': instance.imageUrl,
      'name': instance.name,
    };
