// ignore_for_file: unnecessary_lambdas

import 'package:fedi_app/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'files_cache_settings_model_test_helper.dart';

// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          FilesCacheSettingsModelMockHelper.createTestFilesCacheSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          FilesCacheSettingsModelMockHelper.createTestFilesCacheSettings(
        seed: seed,
      ),
      (json) => FilesCacheSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          FilesCacheSettingsModelMockHelper.createTestFilesCacheSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = FilesCacheSettingsModelMockHelper.createTestFilesCacheSettings(
      seed: 'seed1',
    );
    var obj2 = FilesCacheSettingsModelMockHelper.createTestFilesCacheSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      sizeLimitCountTypeString: obj2.sizeLimitCountTypeString,
      ageLimitTypeString: obj2.ageLimitTypeString,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => FilesCacheSettingsAdapter(),
    );
  });
}
