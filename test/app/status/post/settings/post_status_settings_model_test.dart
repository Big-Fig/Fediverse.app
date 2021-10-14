// ignore_for_file: unnecessary_lambdas

import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../hive/hive_test_helper.dart';
import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'post_status_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PostStatusSettingsModelMockHelper.createTestPostStatusSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          PostStatusSettingsModelMockHelper.createTestPostStatusSettings(
        seed: seed,
      ),
      (json) => PostStatusSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PostStatusSettingsModelMockHelper.createTestPostStatusSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = PostStatusSettingsModelMockHelper.createTestPostStatusSettings(
      seed: 'seed1',
    );
    var obj2 = PostStatusSettingsModelMockHelper.createTestPostStatusSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      markMediaAsNsfwOnAttach: obj2.markMediaAsNsfwOnAttach,
      defaultVisibilityString: obj2.defaultVisibilityString,
      defaultStatusLocale: obj2.defaultStatusLocale,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => PostStatusSettingsAdapter(),
    );
  });
}
