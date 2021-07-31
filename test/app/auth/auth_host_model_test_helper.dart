import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

import 'instance/auth_instance_model_test_helper.dart';

// ignore_for_file: no-magic-number
class AuthHostModelTestHelper {
  static AuthHostRegistrationResult createTestAuthHostRegistrationResult({
    required String seed,
    PleromaApiInstance? pleromaApiInstance,
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
        token: PleromaApiOAuthTestHelper.createTestPleromaApiOAuthToken(
          seed: seed,
        ),
        pleromaInstance: pleromaApiInstance ??
            PleromaApiInstanceTestHelper.createTestPleromaApiInstance(
              seed: seed,
            ),
        authInstance: AuthInstanceModelTestHelper.createTestAuthInstance(
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
