import 'package:fediverse_api/fediverse_api.dart';
import '../../../account/my/unifedi_api_my_account_model.dart';

import '../../scopes/unifedi_api_access_scopes_model.dart';
import '../unifedi_api_access_token_model.dart';

abstract class IUnifediApiAccessUserToken
    implements IFediverseApiAccessUserToken, IUnifediApiAccessToken {
  @override
  IUnifediApiAccessScopes get scopes;

  IUnifediApiMyAccount? get myAccount;
}
