import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'auth_instance_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          AuthInstanceModelTestHelper.createTestAuthInstance(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          AuthInstanceModelTestHelper.createTestAuthInstance(
        seed: seed,
      ),
      AuthInstance.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          AuthInstanceModelTestHelper.createTestAuthInstance(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = AuthInstanceModelTestHelper.createTestAuthInstance(
      seed: "seed1",
    );
    var obj2 = AuthInstanceModelTestHelper.createTestAuthInstance(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      urlSchema: obj2.urlSchema,
      urlHost: obj2.urlHost,
      acct: obj2.acct,
      token: obj2.token,
      authCode: obj2.authCode,
      isPleroma: obj2.isPleroma,
      application: obj2.application,
      info: obj2.info,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => AuthInstanceAdapter(),
    );
  });
}
