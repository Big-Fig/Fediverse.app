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
      recentCodeItems: (fields[2] as List)?.cast<CustomEmojiPickerCodeItem>(),
      recentImageItems:
          (fields[3] as List)?.cast<CustomEmojiPickerImageUrlItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, EmojiPickerRecentCategoryItemsList obj) {
    writer
      ..writeByte(2)
      ..writeByte(2)
      ..write(obj.recentCodeItems)
      ..writeByte(3)
      ..write(obj.recentImageItems);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmojiPickerRecentCategoryItemsList _$EmojiPickerRecentCategoryItemsListFromJson(
    Map<String, dynamic> json) {
  return EmojiPickerRecentCategoryItemsList(
    recentCodeItems: (json['recent_code_items'] as List)
        ?.map((e) => e == null
            ? null
            : CustomEmojiPickerCodeItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recentImageItems: (json['recent_image_items'] as List)
        ?.map((e) => e == null
            ? null
            : CustomEmojiPickerImageUrlItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EmojiPickerRecentCategoryItemsListToJson(
        EmojiPickerRecentCategoryItemsList instance) =>
    <String, dynamic>{
      'recent_code_items':
          instance.recentCodeItems?.map((e) => e?.toJson())?.toList(),
      'recent_image_items':
          instance.recentImageItems?.map((e) => e?.toJson())?.toList(),
    };
