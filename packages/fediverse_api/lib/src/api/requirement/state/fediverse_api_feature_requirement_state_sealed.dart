import 'package:freezed_annotation/freezed_annotation.dart';

import 'reason/fediverse_api_feature_requirement_reason_model.dart';

part 'fediverse_api_feature_requirement_state_sealed.freezed.dart';

@freezed
class FediverseApiFeatureRequirementState
    with _$FediverseApiFeatureRequirementState {
  static const accessibleValue =
      FediverseApiFeatureRequirementState.accessible();

  const factory FediverseApiFeatureRequirementState.accessible() = _Accessible;

  const factory FediverseApiFeatureRequirementState.forbidden(
    List<IFediverseApiFeatureRequirementReason> reasons,
  ) = _Forbidden;

  const factory FediverseApiFeatureRequirementState.unknown(
    List<IFediverseApiFeatureRequirementReason> reasons,
  ) = _Unknown;
}

extension FediverseApiFeatureRequirementStateExtension
    on FediverseApiFeatureRequirementState {
  bool get isAccessible => maybeMap(
        accessible: (_) => true,
        orElse: () => false,
      );

  bool get isForbidden => maybeMap(
        forbidden: (_) => true,
        orElse: () => false,
      );

  bool get isUnknown => maybeMap(
        unknown: (_) => true,
        orElse: () => false,
      );
}
