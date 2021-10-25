import 'package:freezed_annotation/freezed_annotation.dart';

import '../../requirement/access/level/unifedi_api_access_level_requirement_model.dart';
import '../../requirement/access/scopes/unifedi_api_access_scopes_requirement_model.dart';
import '../../requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model.dart';
import '../../requirement/type/unifedi_api_type_not_supported_requirement_model.dart';
import '../unifedi_api_feature_model.dart';

part 'unifedi_api_type_supported_feature_model_impl.freezed.dart';

@freezed
class UnifediApiTypeSupportedFeature
    with _$UnifediApiTypeSupportedFeature
    implements IUnifediApiFeature {
  const UnifediApiTypeSupportedFeature._();
  const factory UnifediApiTypeSupportedFeature() =
      _UnifediApiTypeSupportedFeature;

  @override
  IUnifediApiAccessLevelRequirement? get accessLevelRequirement => null;

  @override
  IUnifediApiAccessScopesRequirement? get accessScopesRequirement => null;

  @override
  IUnifediApiTypeNotSupportedRequirement? get apiTypeNotSupportedRequirement =>
      null;

  @override
  IUnifediApiInstanceMetadataVersionRequirement?
      get instanceVersionRequirement => null;
}
