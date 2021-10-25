import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/chat/message/pleroma_api_chat_message_model_impl.dart';
import 'package:pleroma_api/src/api/chat/message/pleroma_api_chat_message_model_impl_mock_helper.dart';
import 'package:test/test.dart';

void main() {
  test('PleromaApiChatMessage equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiChatMessageMockHelper.generate,
    );
  });

  test('PleromaApiChatMessage toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiChatMessageMockHelper.generate,
      (json) => PleromaApiChatMessage.fromJson(json),
    );
  });
}
