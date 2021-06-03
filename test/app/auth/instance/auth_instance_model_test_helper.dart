import 'package:fedi/app/auth/instance/auth_instance_model.dart';

import '../../../pleroma/api/application/pleroma_api_application_test_helper.dart';
import '../../../pleroma/api/instance/pleroma_api_instance_test_helper.dart';
import '../../../pleroma/api/oauth/pleroma_api_oauth_test_helper.dart';

// ignore_for_file: no-magic-number
class AuthInstanceModelTestHelper {
  static AuthInstance createTestAuthInstance({
    required String seed,
  }) =>
      AuthInstance(
        urlSchema: seed + "urlSchema",
        urlHost: seed + "urlHost",
        acct: seed + "acct",
        token: PleromaApiOAuthTestHelper.createTestPleromaApiOAuthToken(
          seed: seed,
        ),
        authCode: seed + "authCode",
        isPleroma: seed.hashCode % 2 == 0,
        application: PleromaApiApplicationTestHelper
            .createTestPleromaApiClientApplication(
          seed: seed,
        ),
        info: PleromaApiInstanceTestHelper.createTestPleromaApiInstance(
          seed: seed,
        ),
      );
}
