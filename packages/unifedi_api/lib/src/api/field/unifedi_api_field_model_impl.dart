import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_field_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_field_model_impl.freezed.dart';

part 'unifedi_api_field_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiField with _$UnifediApiField implements IUnifediApiField {
  const factory UnifediApiField({
    @HiveField(0) required String? name,
    @HiveField(1) required String? value,
    @HiveField(2) @JsonKey(name: 'verified_at') required DateTime? verifiedAt,
  }) = _UnifediApiField;

  factory UnifediApiField.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiFieldFromJson(json);
}

extension UnifediApiFieldInterfaceExtension on IUnifediApiField {
  UnifediApiField toUnifediApiField({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiField(
          name: name,
          value: value,
          verifiedAt: verifiedAt,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiFieldInterfaceListExtension on List<IUnifediApiField> {
  List<UnifediApiField> toUnifediApiFieldList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiField item) => item.toUnifediApiField(),
        forceNewObject: forceNewObject,
      );
}
