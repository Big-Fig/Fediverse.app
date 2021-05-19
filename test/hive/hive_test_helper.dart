import 'dart:io';

import 'package:fedi/app/hive/hive_service_impl.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/local_preferences/hive_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
// ignore_for_file: no-magic-number, avoid-late-keyword
class HiveTestHelper {
  static void testAdapter<T>(T Function() adapterCreator) {
    var adapter1 = adapterCreator();
    var adapter2 = adapterCreator();

    expect(adapter1 == adapter2, true);
    expect(adapter1.hashCode == adapter2.hashCode, true);
  }

  static Future testHiveSaveAndLoad<T extends IJsonObject>(
    T Function({
      required String seed,
    })
        testHiveObjectCreator, {
    bool skipHiveInit = false,
  }) async {
    late HiveLocalPreferencesService hiveLocalPreferencesService;

    var systemTemp = Directory.systemTemp;

    if (!skipHiveInit) {
      HiveService.registerAdapters();
      Hive.init(systemTemp.path);
    }

    var obj = testHiveObjectCreator(seed: 'seed1');

    var uniquePrefix = obj.toString().substring(0, 3) + obj.hashCode.toString();
    var boxName = 'testHiveSaveAndLoad' + uniquePrefix;

    hiveLocalPreferencesService = HiveLocalPreferencesService(
      boxName: boxName,
    );
    await hiveLocalPreferencesService.performAsyncInit();

    var key = 'key';
    await hiveLocalPreferencesService.setObjectPreference(key, obj);

    await hiveLocalPreferencesService.dispose();
    await Hive.close();

    hiveLocalPreferencesService = HiveLocalPreferencesService(
      boxName: boxName,
    );
    await hiveLocalPreferencesService.performAsyncInit();

    var objFromHive = hiveLocalPreferencesService.getObjectPreference<T>(
      key,
      // hack, code is unused inside
      (jsonData) => obj,
    );

    expect(obj, objFromHive);

    await hiveLocalPreferencesService.clearAllValuesAndDeleteStorage();
  }
}
