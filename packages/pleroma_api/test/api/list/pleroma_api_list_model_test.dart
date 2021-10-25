import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/list/pleroma_api_list_model_impl.dart';
import 'package:pleroma_api/src/api/list/pleroma_api_list_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/hive/pleroma_hive_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('PleromaApiList toPleromaApiList', () async {
    var original = PleromaApiListMockHelper.generate(
      seed: 'seed',
    );
    var obj = original.toPleromaApiList(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiList equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiListMockHelper.generate,
    );
  });

  test('PleromaApiList toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiListMockHelper.generate,
      (json) => PleromaApiList.fromJson(json),
    );
  });
  test('PleromaApiList hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiListMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test(
    'PleromaApiMyAccountNotificationsSettingsAdapter '
    'hive adapter',
    () async {
      HiveTestHelper.testAdapter(() => PleromaApiListAdapter());
    },
  );
}
