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
      name: fields[0] as String,
      imageUrl: fields[1] as String,
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

_$_CustomEmojiPickerImageUrlItem _$$_CustomEmojiPickerImageUrlItemFromJson(
        Map<String, dynamic> json) =>
    _$_CustomEmojiPickerImageUrlItem(
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$_CustomEmojiPickerImageUrlItemToJson(
        _$_CustomEmojiPickerImageUrlItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image_url': instance.imageUrl,
    };
