import '../../../account/my/unifedi_api_my_account_model_impl_mock_helper.dart';
import '../../../oauth/unifedi_api_oauth_model_impl_mock_helper.dart';
import '../../scopes/unifedi_api_access_scopes_model_impl_mock_helper.dart';
import 'unifedi_api_access_user_token_model_impl.dart';

class UnifediApiAccessUserTokenMockHelper {
  static UnifediApiAccessUserToken generate({
    required String seed,
  }) =>
      UnifediApiAccessUserToken(
        oauthToken: UnifediApiOAuthTokenMockHelper.generate(
          seed: seed + 'oauthToken',
        ),
        scopes:
            UnifediApiAccessScopesMockHelper.generate(seed: seed + 'scopes'),
        user: seed + 'user',
        myAccount: UnifediApiMyAccountMockHelper.generate(
          seed: seed + 'myAccount',
        ),
      );
}
