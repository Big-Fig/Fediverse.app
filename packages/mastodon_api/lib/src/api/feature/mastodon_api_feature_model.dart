import 'package:fediverse_api/fediverse_api.dart';

import '../access/mastodon_api_access_model.dart';
import '../requirement/access/level/mastodon_api_access_level_requirement_model.dart';
import '../requirement/access/scopes/mastodon_api_access_scopes_requirement_model.dart';
import '../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model.dart';

abstract class IMastodonApiFeature<T extends IMastodonApiAccess>
    implements IFediverseApiFeature<T> {
  @override
  IMastodonApiAccessLevelRequirement get accessLevelRequirement;

  @override
  IMastodonApiAccessScopesRequirement get accessScopesRequirement;

  @override
  IMastodonApiInstanceMetadataVersionRequirement get instanceVersionRequirement;
}
