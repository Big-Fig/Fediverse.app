import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/conversation/pleroma_api_conversation_model_impl.dart';
import 'package:pleroma_api/src/api/conversation/pleroma_api_conversation_model_impl_mock_helper.dart';
import 'package:test/test.dart';

void main() {
  test(
    'PleromaApiConversationPleromaPart toPleromaApiAccount',
    () async {
      var original = PleromaApiConversationPleromaPartMockHelper.generate(
        seed: 'seed',
      );
      var obj = original.toPleromaApiConversationPleromaPart(
        forceNewObject: true,
      );

      expect(original, obj);
    },
  );

  test('PleromaApiConversation equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiConversationMockHelper.generate,
    );
  });

  test('PleromaApiConversation toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiConversationMockHelper.generate,
      (json) => PleromaApiConversation.fromJson(json),
    );
  });
}
