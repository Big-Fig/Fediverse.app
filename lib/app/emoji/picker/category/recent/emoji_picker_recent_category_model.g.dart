// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_picker_recent_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmojiPickerRecentCategoryItemsListAdapter
    extends TypeAdapter<EmojiPickerRecentCategoryItemsList> {
  @override
  EmojiPickerRecentCategoryItemsList read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmojiPickerRecentCategoryItemsList(
      recentItems: (fields[0] as List)?.cast<CustomEmojiPickerItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, EmojiPickerRecentCategoryItemsList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recentItems);
  }
}
