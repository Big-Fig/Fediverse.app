// ignore_for_file: unnecessary_lambdas

import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../hive/hive_test_helper.dart';
import '../../json/json_test_helper.dart';
import '../../obj/obj_test_helper.dart';
import 'app_analytics_model_test_helper.dart';

// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          AppAnalyticsModelMockHelper.createTestAppAnalyticsData(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          AppAnalyticsModelMockHelper.createTestAppAnalyticsData(
        seed: seed,
      ),
      (json) => AppAnalyticsData.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          AppAnalyticsModelMockHelper.createTestAppAnalyticsData(
        seed: seed,
      ),
    );
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => AppAnalyticsDataAdapter(),
    );
  });
}
