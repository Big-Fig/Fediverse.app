// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_emoji_picker_image_url_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomEmojiPickerImageUrlItemAdapter
    extends TypeAdapter<CustomEmojiPickerImageUrlItem> {
  @override
  CustomEmojiPickerImageUrlItem read(BinaryReader reader) {
    var obj = CustomEmojiPickerImageUrlItem();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.name = reader.read() as String;
          break;
        case 1:
          obj.imageUrl = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, CustomEmojiPickerImageUrlItem obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.name);
    writer.writeByte(1);
    writer.write(obj.imageUrl);
  }
}
