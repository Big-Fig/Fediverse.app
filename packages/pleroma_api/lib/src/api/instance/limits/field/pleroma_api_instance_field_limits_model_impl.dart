import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_instance_field_limits_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_instance_field_limits_model_impl.freezed.dart';

part 'pleroma_api_instance_field_limits_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiInstanceFieldLimits
    with _$PleromaApiInstanceFieldLimits
    implements IPleromaApiInstanceFieldLimits {
  const factory PleromaApiInstanceFieldLimits({
    @HiveField(0) @JsonKey(name: 'max_fields') required int? maxFields,
    @JsonKey(name: 'max_remote_fields')
    @HiveField(1)
        required int? maxRemoteFields,
    @JsonKey(name: 'name_length') @HiveField(2) required int? nameLength,
    @JsonKey(name: 'value_length') @HiveField(3) required int? valueLength,
  }) = _PleromaApiInstanceFieldLimits;

  factory PleromaApiInstanceFieldLimits.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstanceFieldLimitsFromJson(json);
}

extension PleromaApiInstanceFieldLimitsInterfaceExtension
    on IPleromaApiInstanceFieldLimits {
  PleromaApiInstanceFieldLimits toPleromaApiInstanceFieldLimits({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiInstanceFieldLimits(
          maxFields: maxFields,
          maxRemoteFields: maxRemoteFields,
          nameLength: nameLength,
          valueLength: valueLength,
        ),
        forceNewObject: forceNewObject,
      );
}
