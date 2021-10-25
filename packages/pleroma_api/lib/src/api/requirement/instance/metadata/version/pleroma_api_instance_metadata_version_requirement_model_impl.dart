import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../version/range/pleroma_api_version_range_model_impl.dart';
import 'pleroma_api_instance_metadata_version_requirement_model.dart';

part 'pleroma_api_instance_metadata_version_requirement_model_impl.freezed.dart';

part 'pleroma_api_instance_metadata_version_requirement_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiInstanceMetadataVersionRequirement
    with _$PleromaApiInstanceMetadataVersionRequirement
    implements IPleromaApiInstanceMetadataVersionRequirement {
  const factory PleromaApiInstanceMetadataVersionRequirement({
    @HiveField(0)
    @JsonKey(name: 'versionRange')
        required PleromaApiVersionRange versionRange,
  }) = _PleromaApiInstanceMetadataVersionRequirement;

  factory PleromaApiInstanceMetadataVersionRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstanceMetadataVersionRequirementFromJson(json);

  static const any = PleromaApiInstanceMetadataVersionRequirement(
    versionRange: PleromaApiVersionRange(
      min: null,
      max: null,
    ),
  );
}

extension IPleromaApiInstanceMetadataVersionRequirementInterfaceExtension
    on IPleromaApiInstanceMetadataVersionRequirement {
  PleromaApiInstanceMetadataVersionRequirement
      toPleromaApiInstanceMetadataVersionRequirement({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiInstanceMetadataVersionRequirement(
              versionRange: versionRange.toPleromaApiVersionRange(
                forceNewObject: forceNewObject,
              ),
            ),
            forceNewObject: forceNewObject,
          );
}
