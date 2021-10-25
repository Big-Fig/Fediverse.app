import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/feature/unifedi_api_feature_model.dart';
import '../../api/requirement/access/level/unifedi_api_access_level_requirement_model.dart';
import '../../api/requirement/access/scopes/unifedi_api_access_scopes_requirement_model.dart';
import '../../api/requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model.dart';
import '../../api/requirement/type/unifedi_api_type_not_supported_requirement_model.dart';
import '../requirement/access/level/unifedi_api_access_level_requirement_model_mastodon_adapter.dart';
import '../requirement/access/scopes/unifedi_api_access_scopes_requirement_model_mastodon_adapter.dart';
import '../requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model_mastodon_adapter.dart';

part 'unifedi_api_feature_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_feature_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiFeatureMastodonAdapter
    with _$UnifediApiFeatureMastodonAdapter
    implements IUnifediApiFeature {
  const UnifediApiFeatureMastodonAdapter._();
  const factory UnifediApiFeatureMastodonAdapter(
    @HiveField(0) MastodonApiFeature value,
  ) = _UnifediApiFeatureMastodonAdapter;

  @override
  IUnifediApiAccessLevelRequirement get accessLevelRequirement =>
      value.accessLevelRequirement
          .toUnifediApiAccessLevelRequirementMastodonAdapter();

  @override
  IUnifediApiAccessScopesRequirement get accessScopesRequirement =>
      value.accessScopesRequirement
          .toUnifediApiAccessScopesRequirementMastodonAdapter();

  @override
  IUnifediApiInstanceMetadataVersionRequirement
      get instanceVersionRequirement => value.instanceVersionRequirement
          .toUnifediApiInstanceMetadataVersionRequirementMastodonAdapter();

  @override
  IUnifediApiTypeNotSupportedRequirement? get apiTypeNotSupportedRequirement =>
      null;

  factory UnifediApiFeatureMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFeatureMastodonAdapterFromJson(json);
}

extension MastodonApiFeatureUnifediExtension on IMastodonApiFeature {
  UnifediApiFeatureMastodonAdapter toUnifediApiFeatureMastodonAdapter() =>
      UnifediApiFeatureMastodonAdapter(
        toMastodonApiFeature(),
      );
}
