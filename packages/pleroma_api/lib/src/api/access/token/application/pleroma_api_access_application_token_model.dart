import 'package:mastodon_api/mastodon_api.dart';

import '../../../application/client/pleroma_api_client_application_model.dart';
import '../../scopes/pleroma_api_access_scopes_model.dart';
import '../pleroma_api_access_token_model.dart';

abstract class IPleromaApiAccessApplicationToken
    implements IMastodonApiAccessApplicationToken, IPleromaApiAccessToken {
  @override
  IPleromaApiAccessScopes get scopes;

  @override
  IPleromaApiClientApplication get clientApplication;
}
