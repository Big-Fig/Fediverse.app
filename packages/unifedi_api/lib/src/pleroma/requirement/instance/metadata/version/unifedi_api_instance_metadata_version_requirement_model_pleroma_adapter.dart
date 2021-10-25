import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../../api/requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model.dart';
import '../../../../../api/version/range/unifedi_api_version_range_model.dart';
import '../../../../../api/version/unifedi_api_version_model.dart';
import '../../../../version/range/unifedi_api_version_range_model_pleroma_adapter.dart';
import '../../../../version/unifedi_api_version_model_pleroma_adapter.dart';

part 'unifedi_api_instance_metadata_version_requirement_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_metadata_version_requirement_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceMetadataVersionRequirementPleromaAdapter
    with _$UnifediApiInstanceMetadataVersionRequirementPleromaAdapter
    implements IUnifediApiInstanceMetadataVersionRequirement {
  const UnifediApiInstanceMetadataVersionRequirementPleromaAdapter._();
  const factory UnifediApiInstanceMetadataVersionRequirementPleromaAdapter(
    @HiveField(0) PleromaApiInstanceMetadataVersionRequirement value,
  ) = _UnifediApiInstanceMetadataVersionRequirementPleromaAdapter;

  FediverseApiFeatureRequirementState check(IUnifediApiVersion? data) {
    var version = data as UnifediApiVersionPleromaAdapter?;

    return value.check(version?.value);
  }

  @override
  IUnifediApiVersionRange get versionRange =>
      value.versionRange.toUnifediApiVersionRangePleromaAdapter();
  factory UnifediApiInstanceMetadataVersionRequirementPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceMetadataVersionRequirementPleromaAdapterFromJson(
        json,
      );
}

extension PleromaApiInstanceMetadataVersionRequirementUnifediExtension
    on IPleromaApiInstanceMetadataVersionRequirement {
  UnifediApiInstanceMetadataVersionRequirementPleromaAdapter
      toUnifediApiInstanceMetadataVersionRequirementPleromaAdapter() =>
          UnifediApiInstanceMetadataVersionRequirementPleromaAdapter(
            toPleromaApiInstanceMetadataVersionRequirement(),
          );
}
