import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../hive/hive_test_helper.dart';
import '../../../../../json/json_test_helper.dart';
import '../../../../../obj/obj_test_helper.dart';
import 'emoji_picker_recent_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          EmojiPickerRecentCategoryItemsListModelTestHelper
              .createTestEmojiPickerRecentCategoryItemsList(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          EmojiPickerRecentCategoryItemsListModelTestHelper
              .createTestEmojiPickerRecentCategoryItemsList(
        seed: seed,
      ),
      EmojiPickerRecentCategoryItemsList.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          EmojiPickerRecentCategoryItemsListModelTestHelper
              .createTestEmojiPickerRecentCategoryItemsList(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => EmojiPickerRecentCategoryItemsListAdapter(),
    );
  });
}
