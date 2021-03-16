// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_emoji_picker_image_url_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomEmojiPickerImageUrlItemAdapter
    extends TypeAdapter<CustomEmojiPickerImageUrlItem> {
  @override
  final int typeId = 37;

  @override
  CustomEmojiPickerImageUrlItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomEmojiPickerImageUrlItem(
      imageUrl: fields[1] as String?,
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomEmojiPickerImageUrlItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomEmojiPickerImageUrlItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomEmojiPickerImageUrlItem _$CustomEmojiPickerImageUrlItemFromJson(
    Map<String, dynamic> json) {
  return CustomEmojiPickerImageUrlItem(
    imageUrl: json['image_url'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$CustomEmojiPickerImageUrlItemToJson(
        CustomEmojiPickerImageUrlItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image_url': instance.imageUrl,
    };
