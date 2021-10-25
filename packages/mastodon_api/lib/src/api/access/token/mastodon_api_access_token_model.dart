import 'package:fediverse_api/fediverse_api.dart';

import '../../oauth/mastodon_api_oauth_model.dart';
import '../scopes/mastodon_api_access_scopes_model.dart';

abstract class IMastodonApiAccessToken implements IFediverseApiAccessToken {
  @override
  IMastodonApiAccessScopes get scopes;

  IMastodonApiOAuthToken get oauthToken;
}
