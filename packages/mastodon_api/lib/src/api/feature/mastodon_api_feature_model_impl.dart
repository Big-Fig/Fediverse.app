import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import 'mastodon_api_feature_model.dart';
// ignore_for_file: no-magic-number
part 'mastodon_api_feature_model_impl.freezed.dart';

part 'mastodon_api_feature_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiFeature
    with _$MastodonApiFeature
    implements IMastodonApiFeature {
  const factory MastodonApiFeature({
    @HiveField(0)
    @JsonKey(name: 'access_level_requirement')
        required MastodonApiAccessLevelRequirement accessLevelRequirement,
    @HiveField(1)
    @JsonKey(name: 'access_scopes_requirement')
        required MastodonApiAccessScopesRequirement accessScopesRequirement,
    @HiveField(2)
    @JsonKey(name: 'instance_version_requirement')
        required MastodonApiInstanceMetadataVersionRequirement
            instanceVersionRequirement,
  }) = _MastodonApiFeature;

  factory MastodonApiFeature.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiFeatureFromJson(json);

  static final onlyPublicRequirements = MastodonApiFeature(
    accessLevelRequirement: MastodonApiAccessLevelRequirement.publicRequirement,
    accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
    instanceVersionRequirement:
        MastodonApiInstanceMetadataVersionRequirement.any,
  );

  static final onlyUserRequirements = MastodonApiFeature(
    accessLevelRequirement: MastodonApiAccessLevelRequirement.userRequirement,
    accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
    instanceVersionRequirement:
        MastodonApiInstanceMetadataVersionRequirement.any,
  );
  static final onlyApplicationRequirements = MastodonApiFeature(
    accessLevelRequirement:
        MastodonApiAccessLevelRequirement.applicationRequirement,
    accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
    instanceVersionRequirement:
        MastodonApiInstanceMetadataVersionRequirement.any,
  );
}

extension IMastodonApiFeatureInterfaceExtension on IMastodonApiFeature {
  MastodonApiFeature toMastodonApiFeature({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiFeature(
          accessLevelRequirement:
              accessLevelRequirement.toMastodonApiAccessLevelRequirement(
            forceNewObject: forceNewObject,
          ),
          accessScopesRequirement:
              accessScopesRequirement.toMastodonApiAccessScopesRequirement(
            forceNewObject: forceNewObject,
          ),
          instanceVersionRequirement: instanceVersionRequirement
              .toMastodonApiInstanceMetadataVersionRequirement(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
