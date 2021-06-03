import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:fedi/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';

// ignore_for_file: no-magic-number
class EmojiPickerRecentCategoryItemsListModelTestHelper {
  static CustomEmojiPickerCodeItem createTestCustomEmojiPickerCodeItem({
    required String seed,
  }) =>
      CustomEmojiPickerCodeItem(
        name: seed + "name",
        code: seed + "code",
      );

  static CustomEmojiPickerImageUrlItem createTestCustomEmojiPickerImageUrlItem({
    required String seed,
  }) =>
      CustomEmojiPickerImageUrlItem(
        imageUrl: seed + "imageUrl",
        name: seed + "name",
      );

  static EmojiPickerRecentCategoryItemsList
      createTestEmojiPickerRecentCategoryItemsList({
    required String seed,
  }) =>
          EmojiPickerRecentCategoryItemsList(
            recentCodeItems: [
              createTestCustomEmojiPickerCodeItem(seed: seed + "1"),
              createTestCustomEmojiPickerCodeItem(seed: seed + "2"),
            ],
            recentImageItems: [
              createTestCustomEmojiPickerImageUrlItem(seed: seed + "1"),
              createTestCustomEmojiPickerImageUrlItem(seed: seed + "2"),
            ],
          );
}
