import 'package:fediverse_api/fediverse_api.dart';

import '../../../../version/mastodon_api_version_model.dart';
import '../../../../version/range/mastodon_api_version_range_model.dart';
import '../../../mastodon_api_requirement_model.dart';

abstract class IMastodonApiInstanceMetadataVersionRequirement
    implements
        IMastodonApiRequirement<IMastodonApiVersion?>,
        IFediverseApiInstanceMetadataVersionRequirement<IMastodonApiVersion?> {
  @override
  IMastodonApiVersionRange get versionRange;
}

extension IMastodonApiInstanceMetadataVersionRequirementExtension
    on IMastodonApiInstanceMetadataVersionRequirement {
  FediverseApiFeatureRequirementState check(IMastodonApiVersion? data) =>
      FediverseApiInstanceMetadataVersionRequirement.checkState(
        data: data,
        versionRange: versionRange,
      );
}
