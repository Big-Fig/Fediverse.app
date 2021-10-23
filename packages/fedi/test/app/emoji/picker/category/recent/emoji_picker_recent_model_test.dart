// ignore_for_file: unnecessary_lambdas
// ignore_for_file: avoid-ignoring-return-values
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../hive/hive_test_helper.dart';
import '../../../../../json/json_test_helper.dart';
import '../../../../../obj/obj_test_helper.dart';
import 'emoji_picker_recent_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          EmojiPickerRecentCategoryItemsListModelMockHelper
              .createTestEmojiPickerRecentCategoryItemsList(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          EmojiPickerRecentCategoryItemsListModelMockHelper
              .createTestEmojiPickerRecentCategoryItemsList(
        seed: seed,
      ),
      (json) => EmojiPickerRecentCategoryItemsList.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          EmojiPickerRecentCategoryItemsListModelMockHelper
              .createTestEmojiPickerRecentCategoryItemsList(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => EmojiPickerRecentCategoryItemsListAdapter(),
    );
  });
}
