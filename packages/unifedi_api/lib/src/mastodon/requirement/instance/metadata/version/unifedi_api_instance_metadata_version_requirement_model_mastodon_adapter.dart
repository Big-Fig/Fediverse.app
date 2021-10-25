import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../../api/requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model.dart';
import '../../../../../api/version/range/unifedi_api_version_range_model.dart';
import '../../../../../api/version/unifedi_api_version_model.dart';
import '../../../../version/range/unifedi_api_version_range_model_mastodon_adapter.dart';
import '../../../../version/unifedi_api_version_model_mastodon_adapter.dart';

part 'unifedi_api_instance_metadata_version_requirement_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_instance_metadata_version_requirement_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceMetadataVersionRequirementMastodonAdapter
    with _$UnifediApiInstanceMetadataVersionRequirementMastodonAdapter
    implements IUnifediApiInstanceMetadataVersionRequirement {
  const UnifediApiInstanceMetadataVersionRequirementMastodonAdapter._();
  const factory UnifediApiInstanceMetadataVersionRequirementMastodonAdapter(
    @HiveField(0) MastodonApiInstanceMetadataVersionRequirement value,
  ) = _UnifediApiInstanceMetadataVersionRequirementMastodonAdapter;

  FediverseApiFeatureRequirementState check(IUnifediApiVersion? data) {
    var version = data as UnifediApiVersionMastodonAdapter?;

    return value.check(version?.value);
  }

  @override
  IUnifediApiVersionRange get versionRange =>
      value.versionRange.toUnifediApiVersionRangeMastodonAdapter();
  factory UnifediApiInstanceMetadataVersionRequirementMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceMetadataVersionRequirementMastodonAdapterFromJson(
        json,
      );
}

extension MastodonApiInstanceMetadataVersionRequirementUnifediExtension
    on IMastodonApiInstanceMetadataVersionRequirement {
  UnifediApiInstanceMetadataVersionRequirementMastodonAdapter
      toUnifediApiInstanceMetadataVersionRequirementMastodonAdapter() =>
          UnifediApiInstanceMetadataVersionRequirementMastodonAdapter(
            toMastodonApiInstanceMetadataVersionRequirement(),
          );
}
