import 'package:fedi/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emoji_picker_recent_category_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'emoji_picker_recent_category_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 70)
@freezed
class EmojiPickerRecentCategoryItemsList
    with _$EmojiPickerRecentCategoryItemsList
    implements IJsonObj {
  List<CustomEmojiPickerItem> get recentItems {
    var result = <CustomEmojiPickerItem>[];
    // ignore: cascade_invocations
    result
      ..addAll(recentCodeItems)
      ..addAll(recentImageItems);

    return result;
  }

  const EmojiPickerRecentCategoryItemsList._();

  const factory EmojiPickerRecentCategoryItemsList({
    @HiveField(2)
    @JsonKey(name: 'recent_code_items')
        required List<CustomEmojiPickerCodeItem> recentCodeItems,
    @HiveField(3)
    @JsonKey(name: 'recent_image_items')
        required List<CustomEmojiPickerImageUrlItem> recentImageItems,
  }) = _EmojiPickerRecentCategoryItemsList;

  factory EmojiPickerRecentCategoryItemsList.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$EmojiPickerRecentCategoryItemsListFromJson(json);
}
