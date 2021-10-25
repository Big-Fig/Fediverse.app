import 'package:fediverse_api/fediverse_api.dart';

import '../../../../version/pleroma_api_version_model.dart';
import '../../../../version/range/pleroma_api_version_range_model.dart';
import '../../../pleroma_api_requirement_model.dart';

abstract class IPleromaApiInstanceMetadataVersionRequirement
    implements
        IPleromaApiRequirement<IPleromaApiVersion?>,
        IFediverseApiInstanceMetadataVersionRequirement<IPleromaApiVersion?> {
  @override
  IPleromaApiVersionRange get versionRange;
}

extension IPleromaApiInstanceMetadataVersionRequirementExtension
    on IPleromaApiInstanceMetadataVersionRequirement {
  FediverseApiFeatureRequirementState check(IPleromaApiVersion? data) =>
      FediverseApiInstanceMetadataVersionRequirement.checkState(
        data: data,
        versionRange: versionRange,
      );
}
