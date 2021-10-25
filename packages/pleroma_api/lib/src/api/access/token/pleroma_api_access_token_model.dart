import 'package:mastodon_api/mastodon_api.dart';

import '../../oauth/pleroma_api_oauth_model.dart';
import '../scopes/pleroma_api_access_scopes_model.dart';

abstract class IPleromaApiAccessToken implements IMastodonApiAccessToken {
  @override
  IPleromaApiAccessScopes get scopes;

  @override
  IPleromaApiOAuthToken get oauthToken;
}
