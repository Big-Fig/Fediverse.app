import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/oauth/pleroma_api_oauth_test_helper.dart';
import 'package:test/test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiOAuthToken equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiOAuthTestHelper.createTestPleromaApiOAuthToken(
        seed: seed,
      ),
    );
  });

  test('PleromaApiOAuthToken toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiOAuthTestHelper.createTestPleromaApiOAuthToken(
        seed: seed,
      ),
      PleromaApiOAuthToken.fromJson,
    );
  });
  test(
    'PleromaApiOAuthAppTokenRevokeRequest equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        ({required String seed}) => PleromaApiOAuthTestHelper
            .createTestPleromaApiOAuthAppTokenRevokeRequest(
          seed: seed,
        ),
      );
    },
  );

  test('PleromaApiOAuthAppTokenRevokeRequest toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => PleromaApiOAuthTestHelper
          .createTestPleromaApiOAuthAppTokenRevokeRequest(
        seed: seed,
      ),
      PleromaApiOAuthAppTokenRevokeRequest.fromJson,
    );
  });
  test('PleromaApiOAuthAppTokenRequest equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiOAuthTestHelper.createTestPleromaApiOAuthAppTokenRequest(
        seed: seed,
      ),
    );
  });

  test('PleromaApiOAuthAppTokenRequest toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiOAuthTestHelper.createTestPleromaApiOAuthAppTokenRequest(
        seed: seed,
      ),
      PleromaApiOAuthAppTokenRequest.fromJson,
    );
  });
  test(
    'PleromaApiOAuthAccountTokenRequest equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        ({required String seed}) => PleromaApiOAuthTestHelper
            .createTestPleromaApiOAuthAccountTokenRequest(
          seed: seed,
        ),
      );
    },
  );

  test('PleromaApiOAuthAccountTokenRequest toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => PleromaApiOAuthTestHelper
          .createTestPleromaApiOAuthAccountTokenRequest(
        seed: seed,
      ),
      PleromaApiOAuthAccountTokenRequest.fromJson,
    );
  });

  test('PleromaApiOAuthAuthorizeRequest equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiOAuthTestHelper.createTestPleromaApiOAuthAuthorizeRequest(
        seed: seed,
      ),
    );
  });

  test('PleromaApiOAuthAuthorizeRequest toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) =>
          PleromaApiOAuthTestHelper.createTestPleromaApiOAuthAuthorizeRequest(
        seed: seed,
      ),
      PleromaApiOAuthAuthorizeRequest.fromJson,
    );
  });
}
