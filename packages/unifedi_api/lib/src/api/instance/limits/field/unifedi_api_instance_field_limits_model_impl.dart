import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_instance_field_limits_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_field_limits_model_impl.freezed.dart';

part 'unifedi_api_instance_field_limits_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstanceFieldLimits
    with _$UnifediApiInstanceFieldLimits
    implements IUnifediApiInstanceFieldLimits {
  const factory UnifediApiInstanceFieldLimits({
    @HiveField(0) @JsonKey(name: 'max_fields') required int? maxFields,
    @JsonKey(name: 'max_remote_fields')
    @HiveField(1)
        required int? maxRemoteFields,
    @JsonKey(name: 'name_length') @HiveField(2) required int? nameLength,
    @JsonKey(name: 'value_length') @HiveField(3) required int? valueLength,
  }) = _UnifediApiInstanceFieldLimits;

  factory UnifediApiInstanceFieldLimits.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceFieldLimitsFromJson(json);
}

extension UnifediApiInstanceFieldLimitsInterfaceExtension
    on IUnifediApiInstanceFieldLimits {
  UnifediApiInstanceFieldLimits toUnifediApiInstanceFieldLimits({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceFieldLimits(
          maxFields: maxFields,
          maxRemoteFields: maxRemoteFields,
          nameLength: nameLength,
          valueLength: valueLength,
        ),
        forceNewObject: forceNewObject,
      );
}
