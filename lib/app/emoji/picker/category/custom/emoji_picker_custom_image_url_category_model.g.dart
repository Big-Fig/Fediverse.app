// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_picker_custom_image_url_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmojiPickerCustomImageUrlCategoryItemsAdapter
    extends TypeAdapter<EmojiPickerCustomImageUrlCategoryItems> {
  @override
  EmojiPickerCustomImageUrlCategoryItems read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmojiPickerCustomImageUrlCategoryItems(
      items: (fields[0] as List)?.cast<CustomEmojiPickerImageUrlItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, EmojiPickerCustomImageUrlCategoryItems obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.items);
  }
}
