// ignore_for_file: unnecessary_lambdas
// ignore_for_file: avoid-ignoring-return-values
import 'package:fedi_app/app/push/settings/push_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'push_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PushSettingsModelMockHelper.createTestPushSettings(
        seed: seed,
      ),
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          PushSettingsModelMockHelper.createTestPushSettings(
        seed: seed,
      ),
      (json) => PushSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          PushSettingsModelMockHelper.createTestPushSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = PushSettingsModelMockHelper.createTestPushSettings(
      seed: 'seed1',
    );
    var obj2 = PushSettingsModelMockHelper.createTestPushSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      follow: obj2.follow,
      mention: obj2.mention,
      reblog: obj2.reblog,
      poll: obj2.poll,
      chatMention: obj2.chatMention,
      emojiReaction: obj2.emojiReaction,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => PushSettingsAdapter(),
    );
  });
}
