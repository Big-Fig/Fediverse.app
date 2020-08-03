// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_emoji_picker_recent_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomEmojiPickerRecentCategoryItemsListAdapter
    extends TypeAdapter<CustomEmojiPickerRecentCategoryItemsList> {
  @override
  CustomEmojiPickerRecentCategoryItemsList read(BinaryReader reader) {
    var obj = CustomEmojiPickerRecentCategoryItemsList();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.recentItems =
              (reader.read() as List)?.cast<CustomEmojiPickerItem>();
          break;
      }
    }
    return obj;
  }

  @override
  void write(
      BinaryWriter writer, CustomEmojiPickerRecentCategoryItemsList obj) {
    writer.writeByte(1);
    writer.writeByte(0);
    writer.write(obj.recentItems);
  }
}
