// ignore_for_file: unnecessary_lambdas
// ignore_for_file: avoid-ignoring-return-values
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'toast_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          ToastSettingsModelMockHelper.createTestToastSettings(
        seed: seed,
      ),
      skipHashCodeDiffTest: true,
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          ToastSettingsModelMockHelper.createTestToastSettings(
        seed: seed,
      ),
      (json) => ToastSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          ToastSettingsModelMockHelper.createTestToastSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = ToastSettingsModelMockHelper.createTestToastSettings(
      seed: 'seed1',
    );
    var obj2 = ToastSettingsModelMockHelper.createTestToastSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      pushSettings: obj2.pushSettings,
      handlingTypeString: obj2.handlingTypeString,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => ToastSettingsAdapter(),
    );
  });
}
