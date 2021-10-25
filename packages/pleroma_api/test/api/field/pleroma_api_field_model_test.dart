import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/field/pleroma_api_field_model_impl.dart';
import 'package:pleroma_api/src/api/field/pleroma_api_field_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/hive/pleroma_hive_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('PleromaApiField equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiFieldMockHelper.generate,
    );
  });

  test('PleromaApiField toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiFieldMockHelper.generate,
      (json) => PleromaApiField.fromJson(json),
    );
  });

  test('PleromaApiField hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiFieldMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test('PleromaApiField hive adapter', () async {
    HiveTestHelper.testAdapter(() => PleromaApiFieldAdapter());
  });
}
