import 'package:freezed_annotation/freezed_annotation.dart';

import 'fediverse_api_feature_requirement_reason_model.dart';

part 'fediverse_api_feature_requirement_reason_model_impl.freezed.dart';

@freezed
class FediverseApiFeatureRequirementReason
    with _$FediverseApiFeatureRequirementReason
    implements IFediverseApiFeatureRequirementReason {
  const factory FediverseApiFeatureRequirementReason({
    required String name,
    required String description,
  }) = _FediverseApiRequirementReason;
}
