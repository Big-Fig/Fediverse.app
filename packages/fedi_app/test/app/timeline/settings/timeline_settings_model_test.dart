// ignore_for_file: unnecessary_lambdas
// ignore_for_file: avoid-ignoring-return-values
import 'package:fedi_app/app/timeline/settings/timeline_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'timeline_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          TimelineSettingsModelMockHelper.createTestTimelineSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          TimelineSettingsModelMockHelper.createTestTimelineSettings(
        seed: seed,
      ),
      (json) => TimelineSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          TimelineSettingsModelMockHelper.createTestTimelineSettings(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => TimelineSettingsAdapter(),
    );
  });
}
