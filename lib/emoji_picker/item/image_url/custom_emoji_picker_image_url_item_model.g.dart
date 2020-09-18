// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_emoji_picker_image_url_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomEmojiPickerImageUrlItemAdapter
    extends TypeAdapter<CustomEmojiPickerImageUrlItem> {
  @override
  CustomEmojiPickerImageUrlItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomEmojiPickerImageUrlItem(
      imageUrl: fields[1] as String,
      name: fields[0] as String,
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
}
