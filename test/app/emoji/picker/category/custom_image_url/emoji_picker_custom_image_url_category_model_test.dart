import 'package:fedi/app/emoji/picker/category/custom_image_url/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../hive/hive_test_helper.dart';
import '../../../../../json/json_test_helper.dart';
import '../../../../../obj/obj_test_helper.dart';
import 'emoji_picker_custom_image_url_category_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) => CustomEmojiPickerImageUrlItemModelTestHelper
          .createTestEmojiPickerCustomImageUrlCategoryItems(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => CustomEmojiPickerImageUrlItemModelTestHelper
          .createTestEmojiPickerCustomImageUrlCategoryItems(
        seed: seed,
      ),
      EmojiPickerCustomImageUrlCategoryItems.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) => CustomEmojiPickerImageUrlItemModelTestHelper
          .createTestEmojiPickerCustomImageUrlCategoryItems(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => CustomEmojiPickerImageUrlItemAdapter(),
    );
  });
}
