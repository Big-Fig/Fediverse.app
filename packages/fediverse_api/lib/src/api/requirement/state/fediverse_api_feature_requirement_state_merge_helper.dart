import 'fediverse_api_feature_requirement_state_sealed.dart';
import 'reason/fediverse_api_feature_requirement_reason_model.dart';

abstract class FediverseApiFeatureRequirementStateMergeHelper {
  static FediverseApiFeatureRequirementState mergeStates(
    Iterable<FediverseApiFeatureRequirementState> states,
  ) {
    var unknownStates = states.where((state) => state.isUnknown);
    var forbiddenStates = states.where((state) => state.isForbidden);

    return forbiddenStates.isNotEmpty
        ? FediverseApiFeatureRequirementState.forbidden(
            forbiddenStates.mergeReasons(),
          )
        : unknownStates.isNotEmpty
            ? FediverseApiFeatureRequirementState.unknown(
                unknownStates.mergeReasons(),
              )
            : FediverseApiFeatureRequirementState.accessibleValue;
  }
}

extension FediverseApiFeatureRequirementStateMergeExtension
    on Iterable<FediverseApiFeatureRequirementState> {
  FediverseApiFeatureRequirementState merge() =>
      FediverseApiFeatureRequirementStateMergeHelper.mergeStates(
        this,
      );

  List<IFediverseApiFeatureRequirementReason> mergeReasons() => fold(
        <IFediverseApiFeatureRequirementReason>[],
        (
          List<IFediverseApiFeatureRequirementReason> reasons,
          FediverseApiFeatureRequirementState element,
        ) =>
            element.map(
          // nothing
          accessible: (_) => reasons,
          forbidden: (state) {
            reasons.addAll(
              state.reasons,
            );

            return reasons;
          },
          // ignore: no-equal-arguments
          unknown: (state) {
            reasons.addAll(
              state.reasons,
            );

            return reasons;
          },
        ),
      );
}
