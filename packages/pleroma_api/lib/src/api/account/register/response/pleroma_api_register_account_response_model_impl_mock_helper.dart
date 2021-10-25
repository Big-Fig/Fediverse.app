import '../../../oauth/pleroma_api_oauth_model_impl_mock_helper.dart';
import 'pleroma_api_register_account_response_model_impl.dart';

// ignore_for_file: no-magic-number
abstract class PleromaApiRegisterAccountResponseMockHelper {
  static PleromaApiRegisterAccountResponse generate({
    required String seed,
  }) =>
      PleromaApiRegisterAccountResponse(
        approvalRequired: seed.hashCode % 2 == 0,
        emailConformationRequired: seed.hashCode % 2 == 1,
        authToken: PleromaApiOAuthMockHelper.generate(seed: seed + 'authToken'),
      );
}
