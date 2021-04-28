import 'package:fedi/app/emoji/picker/category/custom_image_url/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';

// ignore_for_file: no-magic-number
class CustomEmojiPickerImageUrlItemModelTestHelper {
  static CustomEmojiPickerImageUrlItem createTestCustomEmojiPickerImageUrlItem({
    required String seed,
  }) =>
      CustomEmojiPickerImageUrlItem(
        imageUrl: seed + "imageUrl",
        name: seed + "name",
      );

  static EmojiPickerCustomImageUrlCategoryItems
      createTestEmojiPickerCustomImageUrlCategoryItems({
    required String seed,
  }) =>
          EmojiPickerCustomImageUrlCategoryItems(items: [
            createTestCustomEmojiPickerImageUrlItem(seed: seed + "1"),
            createTestCustomEmojiPickerImageUrlItem(seed: seed + "2"),
          ]);
}
