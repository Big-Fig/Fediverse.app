import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/chat/pleroma_api_chat_model_impl.dart';
import 'package:pleroma_api/src/api/chat/pleroma_api_chat_model_impl_mock_helper.dart';
import 'package:test/test.dart';

void main() {
  test('PleromaApiChat equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiChatMockHelper.generate,
    );
  });

  test('PleromaApiChat toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiChatMockHelper.generate,
      (json) => PleromaApiChat.fromJson(json),
    );
  });

  test('PleromaApiChat copyWith', () async {
    var obj1 = PleromaApiChatMockHelper.generate(
      seed: 'seed1',
    );
    var obj2 = PleromaApiChatMockHelper.generate(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      id: obj2.id,
      unread: obj2.unread,
      account: obj2.account,
      updatedAt: obj2.updatedAt,
      lastMessage: obj2.lastMessage,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });
}
