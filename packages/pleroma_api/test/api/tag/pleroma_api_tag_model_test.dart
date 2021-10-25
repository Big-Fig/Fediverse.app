import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/tag/history/item/pleroma_api_tag_history_item_model_impl.dart';
import 'package:pleroma_api/src/api/tag/history/item/pleroma_api_tag_history_item_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/tag/pleroma_api_tag_model_impl.dart';
import 'package:pleroma_api/src/api/tag/pleroma_api_tag_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/hive/pleroma_hive_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('PleromaApiTag equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiTagMockHelper.generate,
    );
  });

  test('PleromaApiTag toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiTagMockHelper.generate,
      (json) => PleromaApiTag.fromJson(json),
    );
  });

  test('PleromaApiTag hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiTagMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test('PleromaApiTagAdapter hive adapter', () async {
    HiveTestHelper.testAdapter(() => PleromaApiTagAdapter());
  });
  test('PleromaApiTagHistory hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiTagHistoryItemMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test(
    'PleromaApiTagHistoryAdapter hive adapter',
    () async {
      HiveTestHelper.testAdapter(
        () => PleromaApiTagHistoryItemAdapter(),
      );
    },
  );
}
