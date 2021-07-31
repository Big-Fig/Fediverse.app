import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/account/public/pleroma_api_account_public_test_helper.dart';
import 'package:test/test.dart';

import '../../../../json/json_test_helper.dart';
import '../../../../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiMention equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) => PleromaApiAccountPublicTestHelper
          .createTestPleromaApiAccountRegisterRequest(
        seed: seed,
      ),
    );
  });

  test('PleromaApiMention toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => PleromaApiAccountPublicTestHelper
          .createTestPleromaApiAccountRegisterRequest(
        seed: seed,
      ),
      PleromaApiAccountPublicRegisterRequest.fromJson,
    );
  });
}
