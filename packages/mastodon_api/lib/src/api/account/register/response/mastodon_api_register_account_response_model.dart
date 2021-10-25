import '../../../mastodon_api_model.dart';
import '../../../oauth/mastodon_api_oauth_model.dart';

abstract class IMastodonApiRegisterAccountResponse
    implements IMastodonApiObject {
  bool? get approvalRequired;

  IMastodonApiOAuthToken? get authToken;
}
