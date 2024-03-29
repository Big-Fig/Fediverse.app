import 'package:fediverse_api/fediverse_api.dart';

import '../instance/unifedi_api_instance_model.dart';
import '../unifedi_api_model.dart';
import 'level/unifedi_api_access_level_model.dart';
import 'token/application/unifedi_api_access_application_token_model.dart';
import 'token/user/unifedi_api_access_user_token_model.dart';

abstract class IUnifediApiAccess
    implements IFediverseApiAccess, IUnifediApiObject {
  @override
  IUnifediApiInstance? get instance;

  @override
  IUnifediApiAccessLevel get level;

  @override
  IUnifediApiAccessApplicationToken? get applicationAccessToken;

  @override
  IUnifediApiAccessUserToken? get userAccessToken;
}
