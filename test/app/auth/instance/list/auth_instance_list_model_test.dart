import 'package:fedi/app/access/list/auth_instance_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'auth_instance_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          UnifediApiAccessListModelMockHelper.createTestUnifediApiAccessList(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          UnifediApiAccessListModelMockHelper.createTestUnifediApiAccessList(
        seed: seed,
      ),
      UnifediApiAccessList.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          UnifediApiAccessListModelMockHelper.createTestUnifediApiAccessList(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => UnifediApiAccessListAdapter(),
    );
  });
}
