import 'package:fediverse_api/fediverse_api.dart';

import '../instance/mastodon_api_instance_model.dart';
import 'level/mastodon_api_access_level_model.dart';
import 'token/application/mastodon_api_access_application_token_model.dart';
import 'token/user/mastodon_api_access_user_token_model.dart';

abstract class IMastodonApiAccess implements IFediverseApiAccess {
  @override
  IMastodonApiInstance? get instance;

  @override
  IMastodonApiAccessLevel get level;

  @override
  IMastodonApiAccessApplicationToken? get applicationAccessToken;

  @override
  IMastodonApiAccessUserToken? get userAccessToken;
}
