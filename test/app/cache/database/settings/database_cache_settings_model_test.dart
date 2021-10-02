import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'database_cache_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          DatabaseCacheSettingsModelMockHelper.createTestDatabaseCacheSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          DatabaseCacheSettingsModelMockHelper.createTestDatabaseCacheSettings(
        seed: seed,
      ),
      (json) => DatabaseCacheSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          DatabaseCacheSettingsModelMockHelper.createTestDatabaseCacheSettings(
        seed: seed,
      ),
    );
  });

  test('clone', () async {
    var obj1 =
        DatabaseCacheSettingsModelMockHelper.createTestDatabaseCacheSettings(
      seed: 'seed1',
    );

    var obj1Clone = obj1.clone();

    expect(obj1, obj1Clone);
  });

  test('copyWith', () async {
    var obj1 =
        DatabaseCacheSettingsModelMockHelper.createTestDatabaseCacheSettings(
      seed: 'seed1',
    );
    var obj2 =
        DatabaseCacheSettingsModelMockHelper.createTestDatabaseCacheSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      entriesCountByTypeLimitTypeString: obj2.entriesCountByTypeLimitTypeString,
      ageLimitTypeString: obj2.ageLimitTypeString,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => DatabaseCacheSettingsAdapter(),
    );
  });
}
