import '../../../access/level/fediverse_api_access_level_model.dart';
import '../../fediverse_api_requirement_model.dart';
import '../../state/fediverse_api_feature_requirement_state_sealed.dart';
import 'fediverse_api_access_level_requirement_model_impl.dart';

abstract class IFediverseApiAccessLevelRequirement<
    T extends IFediverseApiAccessLevel> implements IFediverseApiRequirement<T> {
  static const requiredAccessLevelIsHigherReasonName =
      'required_access_level_is_higher';

  IFediverseApiAccessLevel get requiredLevel;
}

extension FediverseApiAccessLevelRequirementExtension
    on IFediverseApiAccessLevelRequirement {
  FediverseApiFeatureRequirementState check(IFediverseApiAccessLevel data) =>
      FediverseApiAccessLevelRequirement.checkState(
        data: data,
        requiredLevel: requiredLevel,
      );
}
