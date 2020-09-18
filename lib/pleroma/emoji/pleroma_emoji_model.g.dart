// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_emoji_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaEmojiAdapter extends TypeAdapter<PleromaEmoji> {
  @override
  PleromaEmoji read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaEmoji(
      shortcode: fields[0] as String,
      url: fields[1] as String,
      staticUrl: fields[2] as String,
      visibleInPicker: fields[3] as bool,
      category: fields[4] as String,
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
}

class PleromaCustomEmojiAdapter extends TypeAdapter<PleromaCustomEmoji> {
  @override
  PleromaCustomEmoji read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaCustomEmoji(
      tags: (fields[0] as List)?.cast<String>(),
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
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaEmoji _$PleromaEmojiFromJson(Map<String, dynamic> json) {
  return PleromaEmoji(
    shortcode: json['shortcode'] as String,
    url: json['url'] as String,
    staticUrl: json['static_url'] as String,
    visibleInPicker: json['visible_in_picker'] as bool,
    category: json['category'] as String,
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
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
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
