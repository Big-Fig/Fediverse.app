import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'files_cache_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          FilesCacheSettingsModelTestHelper.createTestFilesCacheSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          FilesCacheSettingsModelTestHelper.createTestFilesCacheSettings(
        seed: seed,
      ),
      FilesCacheSettings.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          FilesCacheSettingsModelTestHelper.createTestFilesCacheSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 =
        FilesCacheSettingsModelTestHelper.createTestFilesCacheSettings(
      seed: "seed1",
    );
    var obj2 =
        FilesCacheSettingsModelTestHelper.createTestFilesCacheSettings(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      sizeLimitCountType: obj2.sizeLimitCountType,
      ageLimitType: obj2.ageLimitType,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => FilesCacheSettingsAdapter(),
    );
  });
}
