import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'custom_emoji_picker_recent_category_model.g.dart';

@HiveType()
class CustomEmojiPickerRecentCategoryItemsList implements IPreferencesObject {
  @HiveField(0)
  List<CustomEmojiPickerItem> recentItems;
  CustomEmojiPickerRecentCategoryItemsList({this.recentItems});


}
