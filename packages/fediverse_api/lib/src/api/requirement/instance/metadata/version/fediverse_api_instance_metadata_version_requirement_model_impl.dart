import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../version/fediverse_api_version_model.dart';
import '../../../../version/range/fediverse_api_version_range_model.dart';
import '../../../../version/range/fediverse_api_version_range_model_impl.dart';
import '../../../state/fediverse_api_feature_requirement_state_sealed.dart';
import '../../../state/reason/fediverse_api_feature_requirement_reason_model_impl.dart';
import 'fediverse_api_instance_metadata_version_requirement_model.dart';

part 'fediverse_api_instance_metadata_version_requirement_model_impl.freezed.dart';

part 'fediverse_api_instance_metadata_version_requirement_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class FediverseApiInstanceMetadataVersionRequirement
    with _$FediverseApiInstanceMetadataVersionRequirement
    implements IFediverseApiInstanceMetadataVersionRequirement {
  const factory FediverseApiInstanceMetadataVersionRequirement({
    @HiveField(0)
    @JsonKey(name: 'version_range')
        required FediverseApiVersionRange versionRange,
  }) = _FediverseApiInstanceMetadataVersionRequirement;

  factory FediverseApiInstanceMetadataVersionRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FediverseApiInstanceMetadataVersionRequirementFromJson(json);

  static FediverseApiFeatureRequirementState checkState({
    required IFediverseApiVersion? data,
    required IFediverseApiVersionRange versionRange,
  }) {
    FediverseApiFeatureRequirementState state;
    if (data != null) {
      var inRange = versionRange.isVersionInRange(data);

      state = inRange
          ? FediverseApiFeatureRequirementState.accessibleValue
          : FediverseApiFeatureRequirementState.forbidden(
              [
                FediverseApiFeatureRequirementReason(
                  name: IFediverseApiInstanceMetadataVersionRequirement
                      .instanceVersionNotInRangeReasonName,
                  description:
                      'Instance version $data not in range $versionRange',
                ),
              ],
            );
    } else {
      state = const FediverseApiFeatureRequirementState.unknown(
        [
          FediverseApiFeatureRequirementReason(
            name: IFediverseApiInstanceMetadataVersionRequirement
                .instanceVersionUnknown,
            description: 'Unknown instance version',
          ),
        ],
      );
    }

    return state;
  }
}
