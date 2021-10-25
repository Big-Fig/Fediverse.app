import 'package:fediverse_api/fediverse_api.dart';

import '../../../application/client/mastodon_api_client_application_model.dart';
import '../mastodon_api_access_token_model.dart';

abstract class IMastodonApiAccessApplicationToken
    implements IMastodonApiAccessToken, IFediverseApiAccessApplicationToken {
  IMastodonApiClientApplication get clientApplication;
}
