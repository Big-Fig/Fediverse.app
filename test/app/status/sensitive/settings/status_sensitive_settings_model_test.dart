// ignore_for_file: unnecessary_lambdas

import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'status_sensitive_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) => StatusSensitiveSettingsModelMockHelper
          .createTestStatusSensitiveSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) => StatusSensitiveSettingsModelMockHelper
          .createTestStatusSensitiveSettings(
        seed: seed,
      ),
      (json) => StatusSensitiveSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) => StatusSensitiveSettingsModelMockHelper
          .createTestStatusSensitiveSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = StatusSensitiveSettingsModelMockHelper
        .createTestStatusSensitiveSettings(
      seed: 'seed1',
    );
    var obj2 = StatusSensitiveSettingsModelMockHelper
        .createTestStatusSensitiveSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      isAlwaysShowNsfw: obj2.isAlwaysShowNsfw,
      isAlwaysShowSpoiler: obj2.isAlwaysShowSpoiler,
      nsfwDisplayDelayDurationMicrosecondsTotal:
          obj2.nsfwDisplayDelayDurationMicrosecondsTotal,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => StatusSensitiveSettingsAdapter(),
    );
  });
}
