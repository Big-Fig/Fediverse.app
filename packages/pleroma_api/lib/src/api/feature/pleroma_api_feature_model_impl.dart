import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../requirement/access/level/pleroma_api_access_level_requirement_model_impl.dart';
import '../requirement/access/scopes/pleroma_api_access_scopes_requirement_model_impl.dart';
import '../requirement/instance/metadata/version/pleroma_api_instance_metadata_version_requirement_model_impl.dart';
import 'pleroma_api_feature_model.dart';
// ignore_for_file: no-magic-number
part 'pleroma_api_feature_model_impl.freezed.dart';

part 'pleroma_api_feature_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiFeature with _$PleromaApiFeature implements IPleromaApiFeature {
  const factory PleromaApiFeature({
    @HiveField(0)
    @JsonKey(name: 'mastodon_api_feature')
        required MastodonApiFeature? mastodonApiFeature,
    @HiveField(1)
    @JsonKey(name: 'access_level_requirement')
        required PleromaApiAccessLevelRequirement accessLevelRequirement,
    @HiveField(2)
    @JsonKey(name: 'access_scope_requirement')
        required PleromaApiAccessScopesRequirement accessScopesRequirement,
    @HiveField(3)
    @JsonKey(name: 'instance_version_requirement')
        required PleromaApiInstanceMetadataVersionRequirement
            instanceVersionRequirement,
    bool? forceNotImplementedYet,
  }) = _PleromaApiFeature;

  factory PleromaApiFeature.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiFeatureFromJson(json);

  static PleromaApiFeature onlyUserRequirements(
    IMastodonApiFeature? mastodonApiFeature,
  ) =>
      PleromaApiFeature(
        mastodonApiFeature: mastodonApiFeature?.toMastodonApiFeature(),
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  static PleromaApiFeature onlyPublicRequirements(
    IMastodonApiFeature? mastodonApiFeature,
  ) =>
      PleromaApiFeature(
        mastodonApiFeature: mastodonApiFeature?.toMastodonApiFeature(),
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  static PleromaApiFeature onlyApplicationRequirements(
    IMastodonApiFeature? mastodonApiFeature,
  ) =>
      PleromaApiFeature(
        mastodonApiFeature: mastodonApiFeature?.toMastodonApiFeature(),
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.applicationRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  static PleromaApiFeature notImplementedYet(
    IMastodonApiFeature? mastodonApiFeature,
  ) =>
      PleromaApiFeature(
        forceNotImplementedYet: true,
        mastodonApiFeature: mastodonApiFeature?.toMastodonApiFeature(),
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );
}

extension IPleromaApiFeatureInterfaceExtension on IPleromaApiFeature {
  PleromaApiFeature toPleromaApiFeature({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiFeature(
          mastodonApiFeature: mastodonApiFeature?.toMastodonApiFeature(
            forceNewObject: forceNewObject,
          ),
          accessLevelRequirement:
              accessLevelRequirement.toPleromaApiAccessLevelRequirement(
            forceNewObject: forceNewObject,
          ),
          accessScopesRequirement:
              accessScopesRequirement.toPleromaApiAccessScopesRequirement(
            forceNewObject: forceNewObject,
          ),
          instanceVersionRequirement: instanceVersionRequirement
              .toPleromaApiInstanceMetadataVersionRequirement(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiFeatureListPleromaExtension on List<IMastodonApiFeature> {
  List<PleromaApiFeature> toPleromaApiFeatureList() => map(
        (mastodonApiFeature) => PleromaApiFeature(
          mastodonApiFeature: mastodonApiFeature.toMastodonApiFeature(),
          accessLevelRequirement:
              PleromaApiAccessLevelRequirement.publicRequirement,
          accessScopesRequirement: PleromaApiAccessScopesRequirement.none,
          instanceVersionRequirement:
              PleromaApiInstanceMetadataVersionRequirement.any,
        ),
      ).toList();
}
