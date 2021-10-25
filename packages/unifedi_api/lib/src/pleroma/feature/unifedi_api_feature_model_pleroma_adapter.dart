import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/feature/unifedi_api_feature_model.dart';
import '../../api/requirement/access/level/unifedi_api_access_level_requirement_model.dart';
import '../../api/requirement/access/scopes/unifedi_api_access_scopes_requirement_model.dart';
import '../../api/requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model.dart';
import '../../api/requirement/type/unifedi_api_type_not_supported_requirement_model.dart';
import '../requirement/access/level/unifedi_api_access_level_requirement_model_pleroma_adapter.dart';
import '../requirement/access/scopes/unifedi_api_access_scopes_requirement_model_pleroma_adapter.dart';
import '../requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model_pleroma_adapter.dart';

part 'unifedi_api_feature_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_feature_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiFeaturePleromaAdapter
    with _$UnifediApiFeaturePleromaAdapter
    implements IUnifediApiFeature {
  const UnifediApiFeaturePleromaAdapter._();
  const factory UnifediApiFeaturePleromaAdapter(
    @HiveField(0) PleromaApiFeature value,
  ) = _UnifediApiFeaturePleromaAdapter;

  @override
  IUnifediApiAccessLevelRequirement get accessLevelRequirement =>
      value.accessLevelRequirement
          .toUnifediApiAccessLevelRequirementPleromaAdapter();

  @override
  IUnifediApiAccessScopesRequirement get accessScopesRequirement =>
      value.accessScopesRequirement
          .toUnifediApiAccessScopesRequirementPleromaAdapter();

  @override
  IUnifediApiTypeNotSupportedRequirement? get apiTypeNotSupportedRequirement =>
      null;

  @override
  IUnifediApiInstanceMetadataVersionRequirement
      get instanceVersionRequirement => value.instanceVersionRequirement
          .toUnifediApiInstanceMetadataVersionRequirementPleromaAdapter();
  factory UnifediApiFeaturePleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFeaturePleromaAdapterFromJson(json);
}

extension PleromaApiFeatureUnifediExtension on IPleromaApiFeature {
  UnifediApiFeaturePleromaAdapter toUnifediApiFeaturePleromaAdapter() =>
      UnifediApiFeaturePleromaAdapter(
        toPleromaApiFeature(),
      );
}
