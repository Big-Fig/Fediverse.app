import 'package:fedi/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'emoji_picker_recent_category_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 70)
@JsonSerializable(explicitToJson: true)
class EmojiPickerRecentCategoryItemsList implements IJsonObject {
  List<CustomEmojiPickerItem> get recentItems {
    var result = <CustomEmojiPickerItem>[];
    result.addAll(recentCodeItems!);
    result.addAll(recentImageItems!);
    return result;
  }

  @HiveField(2)
  @JsonKey(name: "recent_code_items")
  final List<CustomEmojiPickerCodeItem>? recentCodeItems;
  @HiveField(3)
  @JsonKey(name: "recent_image_items")
  final List<CustomEmojiPickerImageUrlItem>? recentImageItems;

  EmojiPickerRecentCategoryItemsList({
    this.recentCodeItems,
    this.recentImageItems,
  });

  static EmojiPickerRecentCategoryItemsList fromJson(
    Map<String, dynamic> json,
  ) =>
      _$EmojiPickerRecentCategoryItemsListFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$EmojiPickerRecentCategoryItemsListToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmojiPickerRecentCategoryItemsList &&
          runtimeType == other.runtimeType &&
          recentItems == other.recentItems;

  @override
  int get hashCode => recentItems.hashCode;

  @override
  String toString() {
    return 'EmojiPickerRecentCategoryItemsList{recentItems: $recentItems}';
  }
}
