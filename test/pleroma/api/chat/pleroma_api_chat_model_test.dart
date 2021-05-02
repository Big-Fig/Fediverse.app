import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_chat_test_helper.dart';

void main() {
  test('PleromaApiChat equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiChatTestHelper.createTestPleromaApiChat(
        seed: seed,
      ),
    );
  });

  test('PleromaApiChat toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiChatTestHelper.createTestPleromaApiChat(
        seed: seed,
      ),
      PleromaApiChat.fromJson,
    );
  });


  test('PleromaApiChat copyWith', () async {
    var obj1 = PleromaApiChatTestHelper.createTestPleromaApiChat(
      seed: "seed1",
    );
    var obj2 = PleromaApiChatTestHelper.createTestPleromaApiChat(
      seed: "seed2",
    );

    var obj2Obj1CopyWith = obj1.copyWith(
      id: obj2.id,
      unread: obj2.unread,
      account: obj2.account,
      updatedAt: obj2.updatedAt,
      lastMessage: obj2.lastMessage
    );

    expect(obj1 == obj2, false);
    expect(obj2, obj2Obj1CopyWith);
    expect(obj1, obj1.copyWith());
  });


}
