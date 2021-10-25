import 'package:fediverse_api/fediverse_api.dart';

import '../../../access/scopes/unifedi_api_access_scopes_model.dart';
import '../../unifedi_api_requirement_model.dart';

abstract class IUnifediApiAccessScopesRequirement
    implements
        IUnifediApiRequirement<IUnifediApiAccessScopes>,
        IFediverseApiAccessScopesRequirement<IUnifediApiAccessScopes> {
  @override
  List<IUnifediApiAccessScopes> get scopesVariants;
}
