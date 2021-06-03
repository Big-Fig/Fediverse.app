import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'timeline_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          TimelineSettingsModelTestHelper.createTestTimelineSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          TimelineSettingsModelTestHelper.createTestTimelineSettings(
        seed: seed,
      ),
      TimelineSettings.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          TimelineSettingsModelTestHelper.createTestTimelineSettings(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => TimelineSettingsAdapter(),
    );
  });
}
