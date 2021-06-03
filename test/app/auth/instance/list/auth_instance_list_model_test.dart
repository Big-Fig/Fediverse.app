import 'package:fedi/app/auth/instance/list/auth_instance_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'auth_instance_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          AuthInstanceListModelTestHelper.createTestAuthInstanceList(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          AuthInstanceListModelTestHelper.createTestAuthInstanceList(
        seed: seed,
      ),
      AuthInstanceList.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          AuthInstanceListModelTestHelper.createTestAuthInstanceList(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => AuthInstanceListAdapter(),
    );
  });
}
