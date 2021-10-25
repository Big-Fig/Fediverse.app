import 'package:fediverse_api/fediverse_api.dart';

import 'item/unifedi_api_access_scopes_item_model.dart';

abstract class IUnifediApiAccessScopes implements IFediverseApiAccessScopes {
  @override
  List<IUnifediApiAccessScopesItem> get targetPermissions;
}
