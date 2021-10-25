import 'package:fediverse_api/fediverse_api.dart';

import '../../../access/level/mastodon_api_access_level_model.dart';
import '../../mastodon_api_requirement_model.dart';

abstract class IMastodonApiAccessLevelRequirement
    implements
        IMastodonApiRequirement<IMastodonApiAccessLevel>,
        IFediverseApiAccessLevelRequirement<IMastodonApiAccessLevel> {
  @override
  IMastodonApiAccessLevel get requiredLevel;
}

extension IMastodonApiAccessLevelRequirementExtension
    on IMastodonApiAccessLevelRequirement {
  FediverseApiFeatureRequirementState check(
    IMastodonApiAccessLevel data,
  ) =>
      FediverseApiAccessLevelRequirement.checkState(
        data: data,
        requiredLevel: requiredLevel,
      );
}
