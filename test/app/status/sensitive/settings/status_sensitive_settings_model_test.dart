import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'status_sensitive_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) => StatusSensitiveSettingsModelTestHelper
          .createTestStatusSensitiveSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => StatusSensitiveSettingsModelTestHelper
          .createTestStatusSensitiveSettings(
        seed: seed,
      ),
      StatusSensitiveSettings.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) => StatusSensitiveSettingsModelTestHelper
          .createTestStatusSensitiveSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = StatusSensitiveSettingsModelTestHelper
        .createTestStatusSensitiveSettings(
      seed: "seed1",
    );
    var obj2 = StatusSensitiveSettingsModelTestHelper
        .createTestStatusSensitiveSettings(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      isAlwaysShowNsfw: obj2.isAlwaysShowNsfw,
      isAlwaysShowSpoiler: obj2.isAlwaysShowSpoiler,
      nsfwDisplayDelayDurationMicrosecondsTotal:
          obj2.nsfwDisplayDelayDurationMicrosecondsTotal,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
  });

  test('clone', () async {
    var obj1 = StatusSensitiveSettingsModelTestHelper
        .createTestStatusSensitiveSettings(
      seed: "seed1",
    );

    var obj1Clone = obj1.clone();

    expect(obj1, obj1Clone);
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => StatusSensitiveSettingsAdapter(),
    );
  });
}
