import 'package:fediverse_api/fediverse_api.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../access/pleroma_api_access_model.dart';
import '../requirement/access/level/pleroma_api_access_level_requirement_model.dart';
import '../requirement/access/scopes/pleroma_api_access_scopes_requirement_model.dart';
import '../requirement/instance/metadata/version/pleroma_api_instance_metadata_version_requirement_model.dart';

abstract class IPleromaApiFeature
    implements IFediverseApiFeature<IPleromaApiAccess> {
  IMastodonApiFeature? get mastodonApiFeature;

  bool? get forceNotImplementedYet;

  @override
  IPleromaApiAccessLevelRequirement get accessLevelRequirement;

  @override
  IPleromaApiAccessScopesRequirement get accessScopesRequirement;

  @override
  IPleromaApiInstanceMetadataVersionRequirement get instanceVersionRequirement;
}
