import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

import 'instance/auth_instance_model_test_helper.dart';

// ignore_for_file: no-magic-number
class AuthHostModelMockHelper {
  static AuthHostRegistrationResult createTestAuthHostRegistrationResult({
    required String seed,
    UnifediApiInstance? unifediApiInstance,
    DisabledRegistrationAuthHostException?
        disabledRegistrationAuthHostException,
    InvitesOnlyRegistrationAuthHostException?
        invitesOnlyRegistrationAuthHostException,
    EmailConfirmationRequiredAuthHostException?
        emailConfirmationRequiredAuthHostException,
    CantRetrieveAppTokenAuthHostException?
        cantRetrieveAppTokenAuthHostException,
    CantRegisterAppAuthHostException? cantRegisterAppAuthHostException,
    dynamic unknownHostException,
  }) =>
      AuthHostRegistrationResult(
        token: UnifediApiOAuthMockHelper.generate(
          seed: seed,
        ),
        unifediApiInstance: unifediApiInstance ??
            UnifediApiInstanceMockHelper.generate(
              seed: seed,
            ),
        authInstance: AuthInstanceModelMockHelper.createTestAuthInstance(
          seed: seed,
        ),
        cantRegisterAppAuthHostException: cantRegisterAppAuthHostException,
        cantRetrieveAppTokenAuthHostException:
            cantRetrieveAppTokenAuthHostException,
        emailConfirmationRequiredAuthHostException:
            emailConfirmationRequiredAuthHostException,
        invitesOnlyRegistrationAuthHostException:
            invitesOnlyRegistrationAuthHostException,
        unknownHostException: unknownHostException,
        disabledRegistrationAuthHostException:
            disabledRegistrationAuthHostException,
      );
}
