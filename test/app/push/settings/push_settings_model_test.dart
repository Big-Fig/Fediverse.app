import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'push_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PushSettingsModelTestHelper.createTestPushSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PushSettingsModelTestHelper.createTestPushSettings(
        seed: seed,
      ),
      PushSettings.fromJson,
    );
  });

  test('hive save&load', () async {
    await HiveTestHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PushSettingsModelTestHelper.createTestPushSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = PushSettingsModelTestHelper.createTestPushSettings(
      seed: 'seed1',
    );
    var obj2 = PushSettingsModelTestHelper.createTestPushSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      follow: obj2.follow,
      mention: obj2.mention,
      reblog: obj2.reblog,
      poll: obj2.poll,
      pleromaChatMention: obj2.pleromaChatMention,
      pleromaEmojiReaction: obj2.pleromaEmojiReaction,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('clone', () async {
    var obj1 = PushSettingsModelTestHelper.createTestPushSettings(
      seed: 'seed1',
    );

    var obj1Clone = obj1.clone();

    expect(obj1, obj1Clone);
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => PushSettingsAdapter(),
    );
  });
}
