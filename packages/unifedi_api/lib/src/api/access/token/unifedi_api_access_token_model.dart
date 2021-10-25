import 'package:fediverse_api/fediverse_api.dart';

import '../../oauth/unifedi_api_oauth_model.dart';
import '../scopes/unifedi_api_access_scopes_model.dart';

abstract class IUnifediApiAccessToken implements IFediverseApiAccessToken {
  @override
  IUnifediApiAccessScopes get scopes;

  IUnifediApiOAuthToken get oauthToken;
}
