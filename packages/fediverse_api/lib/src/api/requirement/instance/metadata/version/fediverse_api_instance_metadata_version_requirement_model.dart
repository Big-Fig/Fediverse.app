import '../../../../../../fediverse_api.dart';

import '../../../fediverse_api_requirement_model.dart';

abstract class IFediverseApiInstanceMetadataVersionRequirement<
    T extends IFediverseApiVersion?> implements IFediverseApiRequirement<T> {
  static const instanceVersionNotInRangeReasonName =
      'instance_version_not_in_range';
  static const instanceVersionUnknown = 'instance_version_unknown';

  IFediverseApiVersionRange get versionRange;
}

extension FediverseApiInstanceMetadataVersionRequirementExtension
    on IFediverseApiInstanceMetadataVersionRequirement {
  FediverseApiFeatureRequirementState check(IFediverseApiVersion? data) =>
      FediverseApiInstanceMetadataVersionRequirement.checkState(
        data: data,
        versionRange: versionRange,
      );
}
