import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'ui_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          UiSettingsModelTestHelper.createTestUiSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          UiSettingsModelTestHelper.createTestUiSettings(
        seed: seed,
      ),
      UiSettings.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          UiSettingsModelTestHelper.createTestUiSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = UiSettingsModelTestHelper.createTestUiSettings(
      seed: 'seed1',
    );
    var obj2 = UiSettingsModelTestHelper.createTestUiSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      themeId: obj2.themeId,
      statusFontSize: obj2.statusFontSize,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('clone', () async {
    var obj1 = UiSettingsModelTestHelper.createTestUiSettings(
      seed: 'seed1',
    );

    var obj1Clone = obj1.clone();

    expect(obj1, obj1Clone);
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => UiSettingsAdapter(),
    );
  });
}
