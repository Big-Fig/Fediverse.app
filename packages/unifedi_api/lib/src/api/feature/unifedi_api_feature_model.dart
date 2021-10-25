import 'package:fediverse_api/fediverse_api.dart';

import '../access/unifedi_api_access_model.dart';
import '../requirement/access/level/unifedi_api_access_level_requirement_model.dart';
import '../requirement/access/scopes/unifedi_api_access_scopes_requirement_model.dart';
import '../requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model.dart';
import '../requirement/type/unifedi_api_type_not_supported_requirement_model.dart';

abstract class IUnifediApiFeature
    implements IFediverseApiFeature<IUnifediApiAccess> {
  IUnifediApiTypeNotSupportedRequirement? get apiTypeNotSupportedRequirement;

  @override
  IUnifediApiAccessLevelRequirement? get accessLevelRequirement;

  @override
  IUnifediApiAccessScopesRequirement? get accessScopesRequirement;

  @override
  IUnifediApiInstanceMetadataVersionRequirement? get instanceVersionRequirement;
}
