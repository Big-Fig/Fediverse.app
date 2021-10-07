import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emoji_picker_custom_image_url_category_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'emoji_picker_custom_image_url_category_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 68)
@freezed
class EmojiPickerCustomImageUrlCategoryItems
    with _$EmojiPickerCustomImageUrlCategoryItems
    implements IJsonObj {
  const factory EmojiPickerCustomImageUrlCategoryItems({
    @HiveField(0) required List<CustomEmojiPickerImageUrlItem> items,
  }) = _EmojiPickerCustomImageUrlCategoryItems;

  factory EmojiPickerCustomImageUrlCategoryItems.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$EmojiPickerCustomImageUrlCategoryItemsFromJson(json);
}
