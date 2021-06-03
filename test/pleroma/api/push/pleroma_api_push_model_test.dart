import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_push_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiPushMessageBody equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiPushTestHelper.createTestPleromaApiPushMessageBody(
        seed: seed,
      ),
    );
  });

  test('PleromaApiPushMessageBody toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiPushTestHelper.createTestPleromaApiPushMessageBody(
        seed: seed,
      ),
      PleromaApiPushMessageBody.fromJson,
    );
  });

  test('PleromaApiPushSubscribeRequest equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiPushTestHelper.createTestPleromaApiPushSubscribeRequest(
        seed: seed,
      ),
    );
  });

  test('PleromaApiPushSubscribeRequest toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiPushTestHelper.createTestPleromaApiPushSubscribeRequest(
        seed: seed,
      ),
      PleromaApiPushSubscribeRequest.fromJson,
    );
  });
}
