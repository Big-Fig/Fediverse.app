import '../../requirement/state/fediverse_api_feature_requirement_state_sealed.dart';

abstract class IFediverseApiRequirementException implements Exception {
  FediverseApiFeatureRequirementState get state;
}
