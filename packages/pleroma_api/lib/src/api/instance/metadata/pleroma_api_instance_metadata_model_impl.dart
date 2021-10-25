import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../federation/pleroma_api_instance_federation_model_impl.dart';
import '../limits/field/pleroma_api_instance_field_limits_model_impl.dart';
import 'pleroma_api_instance_metadata_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_instance_metadata_model_impl.freezed.dart';

part 'pleroma_api_instance_metadata_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiInstanceMetadata
    with _$PleromaApiInstanceMetadata
    implements IPleromaApiInstanceMetadata {
  const factory PleromaApiInstanceMetadata({
    @HiveField(0) required List<String>? features,
    @HiveField(2)
    @JsonKey(name: 'post_formats')
        required List<String>? postFormats,
    @HiveField(3)
    @JsonKey(name: 'account_activation_required')
        required bool? accountActivationRequired,
    @HiveField(4)
    @JsonKey(name: 'fields_limits')
        required PleromaApiInstanceFieldLimits? fieldsLimits,
    @HiveField(5) required PleromaApiInstanceFederation? federation,
  }) = _PleromaApiInstanceMetadata;

  factory PleromaApiInstanceMetadata.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstanceMetadataFromJson(json);
}

extension PleromaApiInstanceMetadataInterfaceExtension
    on IPleromaApiInstanceMetadata {
  PleromaApiInstanceMetadata toPleromaApiInstanceMetadata({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiInstanceMetadata(
          features: features,
          postFormats: postFormats,
          accountActivationRequired: accountActivationRequired,
          fieldsLimits: fieldsLimits?.toPleromaApiInstanceFieldLimits(
            forceNewObject: forceNewObject,
          ),
          federation: federation?.toPleromaApiInstanceFederation(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
