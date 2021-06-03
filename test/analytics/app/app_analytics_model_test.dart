import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../hive/hive_test_helper.dart';
import '../../json/json_test_helper.dart';
import '../../obj/obj_test_helper.dart';
import 'app_analytics_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          AppAnalyticsModelTestHelper.createTestAppAnalyticsData(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          AppAnalyticsModelTestHelper.createTestAppAnalyticsData(
        seed: seed,
      ),
      AppAnalyticsData.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          AppAnalyticsModelTestHelper.createTestAppAnalyticsData(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => AppAnalyticsDataAdapter(),
    );
  });
}
