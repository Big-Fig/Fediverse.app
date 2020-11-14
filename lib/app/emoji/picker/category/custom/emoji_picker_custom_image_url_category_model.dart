import 'dart:convert';

import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emoji_picker_custom_image_url_category_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 68)
@JsonSerializable(explicitToJson: true)
class EmojiPickerCustomImageUrlCategoryItems implements IJsonObject {
  @HiveField(0)
  final List<CustomEmojiPickerImageUrlItem> items;

  EmojiPickerCustomImageUrlCategoryItems({this.items});

  @override
  String toString() {
    return 'EmojiPickerCustomImageUrlCategoryItems{items: $items}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmojiPickerCustomImageUrlCategoryItems &&
          runtimeType == other.runtimeType &&
          items == other.items;

  @override
  int get hashCode => items.hashCode;


  factory EmojiPickerCustomImageUrlCategoryItems.fromJson(Map<String, dynamic> json) =>
      _$EmojiPickerCustomImageUrlCategoryItemsFromJson(json);

  factory EmojiPickerCustomImageUrlCategoryItems.fromJsonString(String jsonString) =>
      _$EmojiPickerCustomImageUrlCategoryItemsFromJson(jsonDecode(jsonString));

  static List<EmojiPickerCustomImageUrlCategoryItems> listFromJsonString(String str) =>
      List<EmojiPickerCustomImageUrlCategoryItems>.from(
          json.decode(str).map((x) => EmojiPickerCustomImageUrlCategoryItems.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$EmojiPickerCustomImageUrlCategoryItemsToJson(this);

  String toJsonString() => jsonEncode(_$EmojiPickerCustomImageUrlCategoryItemsToJson(this));
}
