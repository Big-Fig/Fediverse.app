// ignore_for_file: unnecessary_lambdas
// ignore_for_file: avoid-ignoring-return-values
import 'package:fedi_app/app/chat/settings/chat_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../hive/hive_test_helper.dart';
import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'chat_settings_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjMockHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          ChatSettingsModelMockHelper.createTestChatSettings(
        seed: seed,
      ),
      skipHashCodeDiffTest: true,
    );
  });

  test('toJson & fromJson', () async {
    JsonMockHelper.testFromJsonToJson(
      ({required String seed}) =>
          ChatSettingsModelMockHelper.createTestChatSettings(
        seed: seed,
      ),
      (json) => ChatSettings.fromJson(json),
    );
  });

  test('hive save&load', () async {
    await HiveMockHelper.testHiveSaveAndLoad(
      ({required String seed}) =>
          ChatSettingsModelMockHelper.createTestChatSettings(
        seed: seed,
      ),
    );
  });

  test('copyWith', () async {
    var obj1 = ChatSettingsModelMockHelper.createTestChatSettings(
      seed: 'seed1',
    );
    var obj2 = ChatSettingsModelMockHelper.createTestChatSettings(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      replaceConversationsWithUnifediChats:
          obj2.replaceConversationsWithUnifediChats,
      countConversationsInChatsUnreadBadges:
          obj2.countConversationsInChatsUnreadBadges,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });

  test('hive adapter', () async {
    HiveMockHelper.testAdapter(
      () => ChatSettingsAdapter(),
    );
  });
}
