import 'dart:io';

import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/app/hive/hive_service_impl.dart';
import 'package:fedi/local_preferences/hive_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'app_analytics_model_test_helper.dart';

void main() {

  test('equal & hashcode & toString', () async {
    var obj1 =
        AppAnalyticsModelTestHelper.createTestAppAnalyticsData(seed: "seed1");
    var obj1copy =
        AppAnalyticsModelTestHelper.createTestAppAnalyticsData(seed: "seed1");
    var obj2 =
        AppAnalyticsModelTestHelper.createTestAppAnalyticsData(seed: "seed2");

    expect(obj1 == obj1copy, true);
    expect(obj1 == obj2, false);
    expect(obj1.hashCode == obj1copy.hashCode, true);
    expect(obj1.hashCode == obj2.hashCode, false);
    expect(obj1.toString() == obj1copy.toString(), true);
    expect(obj1.toString() == obj2.toString(), false);
  });

  test('toJson & fromJson', () async {
    var obj =
        AppAnalyticsModelTestHelper.createTestAppAnalyticsData(seed: "seed1");

    var json = obj.toJson();

    var objFromJson = AppAnalyticsData.fromJson(json);

    expect(obj, objFromJson);
  });

  test('hive save&load', () async {
    late HiveLocalPreferencesService hiveLocalPreferencesService;

    var systemTemp = Directory.systemTemp;

    HiveService.registerAdapters();
    Hive.init(systemTemp.path);

    var boxName = 'AppAnalyticsData';

    hiveLocalPreferencesService = HiveLocalPreferencesService(
      boxName: boxName,
    );
    await hiveLocalPreferencesService.performAsyncInit();

    var obj =
        AppAnalyticsModelTestHelper.createTestAppAnalyticsData(seed: "seed1");

    var key = "key";
    await hiveLocalPreferencesService.setObjectPreference(key, obj);

    await hiveLocalPreferencesService.dispose();
    await Hive.close();

    hiveLocalPreferencesService = HiveLocalPreferencesService(
      boxName: boxName,
    );
    await hiveLocalPreferencesService.performAsyncInit();

    AppAnalyticsData? objFromHive =
        hiveLocalPreferencesService.getObjectPreference<AppAnalyticsData>(
      key,
      (jsonData) => AppAnalyticsData.fromJson(jsonData),
    );

    expect(obj, objFromHive);

    await hiveLocalPreferencesService.clearAllValuesAndDeleteStorage();
  });

  test('hive adapter', () async {

    var adapter1 = AppAnalyticsDataAdapter();
    var adapter2 = AppAnalyticsDataAdapter();

    expect(adapter1 == adapter2, true);
    expect(adapter1.hashCode == adapter2.hashCode, true);

  });
}
