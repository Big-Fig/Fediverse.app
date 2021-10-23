// ignore_for_file: unnecessary_lambdas

import 'package:fedi/app/emoji/picker/category/custom_image_url/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../hive/hive_test_helper.dart';
import '../../../../../json/json_test_helper.dart';
import '../../../../../obj/obj_test_helper.dart';
import 'emoji_picker_custom_image_url_category_test_helper.dart';

// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) => CustomEmojiPickerImageUrlItemModelMockHelper
          .createTestEmojiPickerCustomImageUrlCategoryItems(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) => CustomEmojiPickerImageUrlItemModelMockHelper
          .createTestEmojiPickerCustomImageUrlCategoryItems(
        seed: seed,
      ),
      (json) => EmojiPickerCustomImageUrlCategoryItems.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) => CustomEmojiPickerImageUrlItemModelMockHelper
          .createTestEmojiPickerCustomImageUrlCategoryItems(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => CustomEmojiPickerImageUrlItemAdapter(),
    );
  });
}
