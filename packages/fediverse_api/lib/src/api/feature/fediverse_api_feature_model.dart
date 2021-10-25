import '../access/fediverse_api_access_model.dart';
import '../requirement/access/level/fediverse_api_access_level_requirement_model.dart';
import '../requirement/access/scopes/fediverse_api_access_scopes_requirement_model.dart';
import '../requirement/instance/metadata/version/fediverse_api_instance_metadata_version_requirement_model.dart';

abstract class IFediverseApiFeature<T extends IFediverseApiAccess> {
  IFediverseApiAccessLevelRequirement? get accessLevelRequirement;

  IFediverseApiAccessScopesRequirement? get accessScopesRequirement;

  IFediverseApiInstanceMetadataVersionRequirement?
      get instanceVersionRequirement;
}
