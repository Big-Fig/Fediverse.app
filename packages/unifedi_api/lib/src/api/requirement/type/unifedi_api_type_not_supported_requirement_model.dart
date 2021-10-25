import 'package:fediverse_api/fediverse_api.dart';

import '../../instance/type/unifedi_api_instance_type_model.dart';
import '../unifedi_api_requirement_model.dart';

abstract class IUnifediApiTypeNotSupportedRequirement
    implements IUnifediApiRequirement<UnifediApiInstanceType?> {
  String get target;
}

extension IUnifediApiTypeNotSupportedRequirementExtension
    on IUnifediApiTypeNotSupportedRequirement {
  FediverseApiFeatureRequirementState check(UnifediApiInstanceType? data) =>
      FediverseApiFeatureRequirementState.forbidden(
        [
          FediverseApiFeatureRequirementReason(
            name: 'TypeNotSupportedRequirement',
            description: 'Target $target not supported on instance $data',
          ),
        ],
      );
}
