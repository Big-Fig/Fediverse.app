import 'package:fediverse_api/fediverse_api.dart';

import '../../../account/my/mastodon_api_my_account_model.dart';
import '../../scopes/mastodon_api_access_scopes_model.dart';
import '../mastodon_api_access_token_model.dart';

abstract class IMastodonApiAccessUserToken
    implements IFediverseApiAccessUserToken, IMastodonApiAccessToken {
  @override
  IMastodonApiAccessScopes get scopes;

  IMastodonApiMyAccount? get myAccount;
}
