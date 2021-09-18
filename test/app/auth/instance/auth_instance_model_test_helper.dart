import 'package:fedi/app/auth/instance/auth_instance_model.dart';

import 'package:unifedi_api/unifedi_api_mock_helper.dart';

// ignore_for_file: no-magic-number
class AuthInstanceModelMockHelper {
  static AuthInstance createTestAuthInstance({
    required String seed,
  }) =>
      AuthInstance(
        urlSchema: seed + 'urlSchema',
        urlHost: seed + 'urlHost',
        acct: seed + 'acct',
        token: UnifediApiOAuthMockHelper.generate(
          seed: seed,
        ),
        authCode: seed + 'authCode',
        isPleroma: seed.hashCode % 2 == 0,
        application: UnifediApiClientApplicationMockHelper
            .generate(
          seed: seed,
        ),
        info: UnifediApiInstanceMockHelper.generate(
          seed: seed,
        ),
      );
}
