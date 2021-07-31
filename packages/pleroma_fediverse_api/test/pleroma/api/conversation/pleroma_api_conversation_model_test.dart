import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/conversation/pleroma_api_conversation_test_helper.dart';
import 'package:test/test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

void main() {
  test('PleromaApiConversationPleromaPart toPleromaApiAccount', () async {
    var original = PleromaApiConversationTestHelper
        .createTestPleromaApiConversationPleromaPart(
      seed: 'seed',
    );
    var obj =
        original.toPleromaApiConversationPleromaPart(forceNewObject: true);

    expect(original, obj);
  });

  test('PleromaApiConversation equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiConversationTestHelper.createTestPleromaApiConversation(
        seed: seed,
      ),
    );
  });

  test('PleromaApiConversation toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiConversationTestHelper.createTestPleromaApiConversation(
        seed: seed,
      ),
      PleromaApiConversation.fromJson,
    );
  });
}
