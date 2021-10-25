import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../version/mastodon_api_version_model_impl.dart';
import '../../../../version/range/mastodon_api_version_range_model_impl.dart';
import 'mastodon_api_instance_metadata_version_requirement_model.dart';

part 'mastodon_api_instance_metadata_version_requirement_model_impl.freezed.dart';

part 'mastodon_api_instance_metadata_version_requirement_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiInstanceMetadataVersionRequirement
    with _$MastodonApiInstanceMetadataVersionRequirement
    implements IMastodonApiInstanceMetadataVersionRequirement {
  const factory MastodonApiInstanceMetadataVersionRequirement({
    @HiveField(0)
    @JsonKey(name: 'version_range')
        required MastodonApiVersionRange versionRange,
  }) = _MastodonApiInstanceMetadataVersionRequirement;

  factory MastodonApiInstanceMetadataVersionRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiInstanceMetadataVersionRequirementFromJson(json);

  static const any = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: null,
      max: null,
    ),
  );

  static const atLeast2_3_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_3_0,
      max: null,
    ),
  );

  static const atLeast1_1_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v1_1_0,
      max: null,
    ),
  );
  static const atLeast3_1_4 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v3_1_4,
      max: null,
    ),
  );
  static const atLeast1_3_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v1_3_0,
      max: null,
    ),
  );

  static const atLeast1_1_1 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v1_1_1,
      max: null,
    ),
  );

  static const atLeast3_0_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v3_0_0,
      max: null,
    ),
  );
  static const atLeast2_4_3 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_4_3,
      max: null,
    ),
  );

  static const atLeast3_1_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v3_1_0,
      max: null,
    ),
  );

  static const atLeast3_1_3 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v3_1_3,
      max: null,
    ),
  );

  static const atLeast1_4_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v1_4_0,
      max: null,
    ),
  );

  static const atLeast3_2_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v3_2_0,
      max: null,
    ),
  );

  static const atLeast2_1_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_1_0,
      max: null,
    ),
  );

  static const atLeast2_1_2 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_1_2,
      max: null,
    ),
  );

  static const atLeast2_0_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_0_0,
      max: null,
    ),
  );

  static const atLeast2_6_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_6_0,
      max: null,
    ),
  );

  static const atLeast2_9_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_9_0,
      max: null,
    ),
  );

  static const atLeast2_7_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_7_0,
      max: null,
    ),
  );

  static const atLeast2_4_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_4_0,
      max: null,
    ),
  );

  static const atLeast2_4_1 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_4_1,
      max: null,
    ),
  );

  static const atLeast2_5_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_5_0,
      max: null,
    ),
  );

  static const atLeast2_8_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v2_8_0,
      max: null,
    ),
  );

  static const atLeast3_3_0 = MastodonApiInstanceMetadataVersionRequirement(
    versionRange: MastodonApiVersionRange(
      min: MastodonApiVersion.v3_3_0,
      max: null,
    ),
  );
}

extension IMastodonApiInstanceMetadataVersionRequirementInterfaceExtension
    on IMastodonApiInstanceMetadataVersionRequirement {
  MastodonApiInstanceMetadataVersionRequirement
      toMastodonApiInstanceMetadataVersionRequirement({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => MastodonApiInstanceMetadataVersionRequirement(
              versionRange: versionRange.toMastodonApiVersionRange(
                forceNewObject: forceNewObject,
              ),
            ),
            forceNewObject: forceNewObject,
          );
}
