import '../../../oauth/unifedi_api_oauth_model_impl_mock_helper.dart';
import 'unifedi_api_register_account_response_model_impl.dart';

// ignore_for_file: no-magic-number
abstract class UnifediApiRegisterAccountResponseMockHelper {
  static UnifediApiRegisterAccountResponse generate({
    required String seed,
  }) =>
      UnifediApiRegisterAccountResponse(
        approvalRequired: seed.hashCode % 2 == 0,
        emailConformationRequired: seed.hashCode % 2 == 1,
        authToken:
            UnifediApiOAuthTokenMockHelper.generate(seed: seed + 'authToken'),
      );
}
