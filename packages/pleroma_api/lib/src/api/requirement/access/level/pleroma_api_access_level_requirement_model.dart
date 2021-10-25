import 'package:fediverse_api/fediverse_api.dart';

import '../../../access/level/pleroma_api_access_level_model.dart';
import '../../pleroma_api_requirement_model.dart';

abstract class IPleromaApiAccessLevelRequirement
    implements
        IPleromaApiRequirement<IPleromaApiAccessLevel>,
        IFediverseApiAccessLevelRequirement<IPleromaApiAccessLevel> {
  @override
  IPleromaApiAccessLevel get requiredLevel;
}

extension IPleromaApiAccessLevelRequirementExtension
    on IPleromaApiAccessLevelRequirement {
  FediverseApiFeatureRequirementState check(
    IPleromaApiAccessLevel data,
  ) =>
      FediverseApiAccessLevelRequirement.checkState(
        data: data,
        requiredLevel: requiredLevel,
      );
}
