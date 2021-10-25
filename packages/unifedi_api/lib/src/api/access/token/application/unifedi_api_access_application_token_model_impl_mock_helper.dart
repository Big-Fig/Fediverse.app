import '../../../../../unifedi_api.dart';
import '../../../application/client/unifedi_api_client_application_model_impl_mock_helper.dart';
import '../../../oauth/unifedi_api_oauth_model_impl_mock_helper.dart';
import '../../scopes/unifedi_api_access_scopes_model_impl_mock_helper.dart';
import 'unifedi_api_access_application_token_model_impl.dart';

class UnifediApiAccessApplicationTokenMockHelper {
  static UnifediApiAccessApplicationToken generate({
    required String seed,
  }) =>
      UnifediApiAccessApplicationToken(
        oauthToken: UnifediApiOAuthTokenMockHelper.generate(
          seed: seed + 'oauthToken',
        ),
        scopes:
            UnifediApiAccessScopesMockHelper.generate(seed: seed + 'scopes'),
        clientApplication: UnifediApiClientApplicationMockHelper.generate(
          seed: seed + 'clientApplication',
        ),
      );
}
