import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'pleroma_api_poll_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiPoll equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiPollTestHelper.createTestPleromaApiPoll(
        seed: seed,
      ),
    );
  });

  test('PleromaApiPoll toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiPollTestHelper.createTestPleromaApiPoll(
        seed: seed,
      ),
      PleromaApiPoll.fromJson,
    );
  });
}
