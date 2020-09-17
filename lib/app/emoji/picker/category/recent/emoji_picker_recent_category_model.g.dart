// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_picker_recent_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmojiPickerRecentCategoryItemsListAdapter
    extends TypeAdapter<EmojiPickerRecentCategoryItemsList> {
  @override
  final int typeId = 38;

  @override
  EmojiPickerRecentCategoryItemsList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmojiPickerRecentCategoryItemsListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
