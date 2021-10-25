import '../../../oauth/mastodon_api_oauth_model_impl_mock_helper.dart';
import 'mastodon_api_register_account_response_model_impl.dart';

// ignore_for_file: no-magic-number
abstract class MastodonApiRegisterAccountResponseMockHelper {
  static MastodonApiRegisterAccountResponse generate({
    required String seed,
  }) =>
      MastodonApiRegisterAccountResponse(
        approvalRequired: seed.hashCode % 2 == 0,
        authToken:
            MastodonApiOAuthMockHelper.generate(seed: seed + 'authToken'),
      );
}
