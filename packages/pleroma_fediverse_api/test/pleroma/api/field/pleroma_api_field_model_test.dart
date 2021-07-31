import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/field/pleroma_api_field_test_helper.dart';
import 'package:test/test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiField equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiFieldTestHelper.createTestPleromaApiField(
        seed: seed,
      ),
    );
  });

  test('PleromaApiField toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiFieldTestHelper.createTestPleromaApiField(
        seed: seed,
      ),
      PleromaApiField.fromJson,
    );
  });

  test('PleromaApiField hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PleromaApiFieldTestHelper.createTestPleromaApiField(
        seed: seed,
      ),
    );
  });

  test('PleromaApiField hive adapter', () async {
    HiveTestHelper.testAdapter(() => PleromaApiFieldAdapter());
  });
}
