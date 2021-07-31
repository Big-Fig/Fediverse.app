import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

// ignore_for_file: no-magic-number
class AuthInstanceModelTestHelper {
  static AuthInstance createTestAuthInstance({
    required String seed,
  }) =>
      AuthInstance(
        urlSchema: seed + 'urlSchema',
        urlHost: seed + 'urlHost',
        acct: seed + 'acct',
        token: PleromaApiOAuthTestHelper.createTestPleromaApiOAuthToken(
          seed: seed,
        ),
        authCode: seed + 'authCode',
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
