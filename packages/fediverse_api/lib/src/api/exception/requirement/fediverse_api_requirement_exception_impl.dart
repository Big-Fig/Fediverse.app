import 'package:freezed_annotation/freezed_annotation.dart';

import '../../requirement/state/fediverse_api_feature_requirement_state_sealed.dart';
import 'fediverse_api_requirement_exception.dart';

part 'fediverse_api_requirement_exception_impl.freezed.dart';

@freezed
class FediverseApiRequirementException
    with _$FediverseApiRequirementException
    implements IFediverseApiRequirementException {
  const factory FediverseApiRequirementException({
    required FediverseApiFeatureRequirementState state,
  }) = _FediverseApiRequirementException;
}
