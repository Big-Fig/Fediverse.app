import 'package:fediverse_api/fediverse_api.dart';

import '../../../application/client/unifedi_api_client_application_model.dart';
import '../../scopes/unifedi_api_access_scopes_model.dart';
import '../unifedi_api_access_token_model.dart';

abstract class IUnifediApiAccessApplicationToken
    implements IFediverseApiAccessApplicationToken, IUnifediApiAccessToken {
  @override
  IUnifediApiAccessScopes get scopes;

  IUnifediApiClientApplication get clientApplication;
}
