// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_custom_emoji_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiCustomEmojiAdapter extends TypeAdapter<PleromaApiCustomEmoji> {
  @override
  final int typeId = 0;

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

_$_PleromaApiCustomEmoji _$$_PleromaApiCustomEmojiFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiCustomEmoji(
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_PleromaApiCustomEmojiToJson(
    _$_PleromaApiCustomEmoji instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags);
  val['image_url'] = instance.imageUrl;
  val['name'] = instance.name;
  return val;
}
