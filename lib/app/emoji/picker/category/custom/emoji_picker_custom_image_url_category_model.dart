import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'emoji_picker_custom_image_url_category_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType()
// @HiveType(typeId: -32 + 68)
class EmojiPickerCustomImageUrlCategoryItems implements IPreferencesObject {
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
}
