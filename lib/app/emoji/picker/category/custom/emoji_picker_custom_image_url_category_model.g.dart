// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_picker_custom_image_url_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmojiPickerCustomImageUrlCategoryItemsAdapter
    extends TypeAdapter<EmojiPickerCustomImageUrlCategoryItems> {
  @override
  EmojiPickerCustomImageUrlCategoryItems read(BinaryReader reader) {
    var obj = EmojiPickerCustomImageUrlCategoryItems();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.items =
              (reader.read() as List)?.cast<CustomEmojiPickerImageUrlItem>();
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, EmojiPickerCustomImageUrlCategoryItems obj) {
    writer.writeByte(1);
    writer.writeByte(0);
    writer.write(obj.items);
  }
}
