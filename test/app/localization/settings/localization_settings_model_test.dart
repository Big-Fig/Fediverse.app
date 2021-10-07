import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'localization_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          LocalizationSettingsModelMockHelper.createTestLocalizationSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          LocalizationSettingsModelMockHelper.createTestLocalizationSettings(
        seed: seed,
      ),
      (json) => LocalizationSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          LocalizationSettingsModelMockHelper.createTestLocalizationSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 =
        LocalizationSettingsModelMockHelper.createTestLocalizationSettings(
      seed: 'seed1',
    );
    var obj2 =
        LocalizationSettingsModelMockHelper.createTestLocalizationSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      localizationLocale: obj2.localizationLocale,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('clone', () async {
    var obj1 =
        LocalizationSettingsModelMockHelper.createTestLocalizationSettings(
      seed: 'seed1',
    );

    var obj1Clone = obj1.clone();

    expect(obj1, obj1Clone);
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => LocalizationSettingsAdapter(),
    );
  });
}
