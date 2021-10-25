import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_field_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_field_model_impl.freezed.dart';

part 'pleroma_api_field_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiField with _$PleromaApiField implements IPleromaApiField {
  const factory PleromaApiField({
    @HiveField(0) required String? name,
    @HiveField(1) required String? value,
    @HiveField(2) @JsonKey(name: 'verified_at') required DateTime? verifiedAt,
  }) = _PleromaApiField;

  factory PleromaApiField.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiFieldFromJson(json);
}

extension PleromaApiFieldInterfaceExtension on IPleromaApiField {
  PleromaApiField toPleromaApiField({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiField(
          name: name,
          value: value,
          verifiedAt: verifiedAt,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiFieldInterfaceListExtension on List<IPleromaApiField> {
  List<PleromaApiField> toPleromaApiFieldList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiField item) => item.toPleromaApiField(),
        forceNewObject: forceNewObject,
      );
}
