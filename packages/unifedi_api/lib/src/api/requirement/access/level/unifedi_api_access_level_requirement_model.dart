import 'package:fediverse_api/fediverse_api.dart';
import '../../../access/level/unifedi_api_access_level_model.dart';

import '../../unifedi_api_requirement_model.dart';

abstract class IUnifediApiAccessLevelRequirement
    implements
        IUnifediApiRequirement<IUnifediApiAccessLevel>,
        IFediverseApiAccessLevelRequirement<IUnifediApiAccessLevel> {
  @override
  IUnifediApiAccessLevel get requiredLevel;
}
