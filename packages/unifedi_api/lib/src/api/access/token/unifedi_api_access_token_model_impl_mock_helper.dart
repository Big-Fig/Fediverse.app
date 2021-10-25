import '../../oauth/unifedi_api_oauth_model_impl_mock_helper.dart';
import '../scopes/unifedi_api_access_scopes_model_impl_mock_helper.dart';
import 'unifedi_api_access_token_model_impl.dart';

class UnifediApiAccessTokenMockHelper {
  static UnifediApiAccessToken generate({
    required String seed,
  }) =>
      UnifediApiAccessToken(
        oauthToken: UnifediApiOAuthTokenMockHelper.generate(
          seed: seed + 'oauthToken',
        ),
        scopes:
            UnifediApiAccessScopesMockHelper.generate(seed: seed + 'scopes'),
      );
}
