import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/oauth/pleroma_api_oauth_model_impl.dart';
import 'package:pleroma_api/src/api/oauth/pleroma_api_oauth_model_impl_mock_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiOAuthToken equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiOAuthMockHelper.generate,
    );
  });

  test('PleromaApiOAuthToken toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiOAuthMockHelper.generate,
      (json) => PleromaApiOAuthToken.fromJson(json),
    );
  });
}
