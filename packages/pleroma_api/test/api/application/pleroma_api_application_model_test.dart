import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/application/client/pleroma_api_client_application_model_impl.dart';
import 'package:pleroma_api/src/api/application/client/pleroma_api_client_application_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/api/application/pleroma_api_application_model_impl.dart';
import 'package:pleroma_api/src/api/application/pleroma_api_application_model_impl_mock_helper.dart';
import 'package:pleroma_api/src/hive/pleroma_hive_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: avoid-ignoring-return-values
void main() {
  test(
    'PleromaApiApplication toPleromaApiApplication',
    () async {
      var original = PleromaApiApplicationMockHelper.generate(
        seed: 'seed',
      );
      var obj = original.toPleromaApiApplication(forceNewObject: true);

      expect(original, obj);
    },
  );

  test('PleromaApiApplication equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiApplicationMockHelper.generate,
    );
  });

  test('PleromaApiApplication toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiApplicationMockHelper.generate,
      (json) => PleromaApiApplication.fromJson(json),
    );
  });

  test(
    'PleromaApiClientApplication toPleromaApiClientApplication',
    () async {
      var original = PleromaApiClientApplicationMockHelper.generate(
        seed: 'seed',
      );

      var obj = original.toPleromaApiClientApplication(forceNewObject: true);

      expect(original, obj);
    },
  );

  test(
    'PleromaApiClientApplication equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        PleromaApiClientApplicationMockHelper.generate,
      );
    },
  );

  test('PleromaApiClientApplication toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiClientApplicationMockHelper.generate,
      (json) => PleromaApiClientApplication.fromJson(json),
    );
  });

  test('PleromaApiClientApplication hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      PleromaApiClientApplicationMockHelper.generate,
      nestedTypeRegistryAdapters: [
        PleromaHiveHelper.defaultNestedTypeRegistryAdapter(),
      ],
    );
  });

  test('PleromaApiClientApplication hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiClientApplicationAdapter(),
    );
  });
}
