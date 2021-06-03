import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';
import 'pleroma_api_chat_message_test_helper.dart';

void main() {
  test('PleromaApiChatMessage equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiChatMessageTestHelper.createTestPleromaApiChatMessage(
        seed: seed,
      ),
    );
  });

  test('PleromaApiChatMessage toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiChatMessageTestHelper.createTestPleromaApiChatMessage(
        seed: seed,
      ),
      PleromaApiChatMessage.fromJson,
    );
  });

  test('PleromaApiChatMessageSendData equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) => PleromaApiChatMessageTestHelper
          .createTestPleromaApiChatMessageSendData(
        seed: seed,
      ),
    );
  });

  test('PleromaApiChatMessageSendData toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => PleromaApiChatMessageTestHelper
          .createTestPleromaApiChatMessageSendData(
        seed: seed,
      ),
      PleromaApiChatMessageSendData.fromJson,
    );
  });

  test('PleromaApiChatMessageSendData copyWith', () async {
    var obj1 =
        PleromaApiChatMessageTestHelper.createTestPleromaApiChatMessageSendData(
      seed: 'seed1',
    );
    var obj2 =
        PleromaApiChatMessageTestHelper.createTestPleromaApiChatMessageSendData(
      seed: 'seed2',
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      content: obj2.content,
      mediaId: obj2.mediaId,
      idempotencyKey: obj2.idempotencyKey,
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });
}
