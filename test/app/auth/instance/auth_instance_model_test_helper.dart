import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
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
        application: UnifediApiApplicationMockHelper
            .createTestUnifediApiClientApplication(
          seed: seed,
        ),
        info: UnifediApiInstanceMockHelper.createTestUnifediApiInstance(
          seed: seed,
        ),
      );
}
