import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/application/pleroma_api_application_test_helper.dart';
import 'package:test/test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

void main() {
  test('PleromaApiApplication toPleromaApiApplication', () async {
    var original =
        PleromaApiApplicationTestHelper.createTestPleromaApiApplication(
      seed: 'seed',
    );
    var obj = original.toPleromaApiApplication(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiApplication equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiApplicationTestHelper.createTestPleromaApiApplication(
        seed: seed,
      ),
    );
  });

  test('PleromaApiApplication toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiApplicationTestHelper.createTestPleromaApiApplication(
        seed: seed,
      ),
      PleromaApiApplication.fromJson,
    );
  });

  test('PleromaApiClientApplication toPleromaApiClientApplication', () async {
    var original =
        PleromaApiApplicationTestHelper.createTestPleromaApiClientApplication(
      seed: 'seed',
    );
    var obj = original.toPleromaApiClientApplication(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiClientApplication equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiApplicationTestHelper.createTestPleromaApiClientApplication(
        seed: seed,
      ),
    );
  });

  test('PleromaApiClientApplication toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiApplicationTestHelper.createTestPleromaApiClientApplication(
        seed: seed,
      ),
      PleromaApiClientApplication.fromJson,
    );
  });

  test('PleromaApiClientApplication hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiApplicationTestHelper.createTestPleromaApiClientApplication(
        seed: seed,
      ),
    );
  });

  test('PleromaApiClientApplication hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PleromaApiClientApplicationAdapter(),
    );
  });
}
