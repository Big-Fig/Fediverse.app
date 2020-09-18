import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'emoji_picker_recent_category_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType()
// @HiveType(typeId: -32 + 70)
class EmojiPickerRecentCategoryItemsList implements IPreferencesObject {
  @HiveField(0)
  final List<CustomEmojiPickerItem> recentItems;
  EmojiPickerRecentCategoryItemsList({this.recentItems});


}
