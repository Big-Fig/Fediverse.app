import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_instance_federation_mfr_object_age_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_federation_mfr_object_age_model_impl.freezed.dart';

part 'unifedi_api_instance_federation_mfr_object_age_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstanceFederationMfrObjectAge
    with _$UnifediApiInstanceFederationMfrObjectAge
    implements IUnifediApiInstanceFederationMfrObjectAge {
  const factory UnifediApiInstanceFederationMfrObjectAge({
    @HiveField(0) required int? threshold,
    @HiveField(1) required List<String>? actions,
  }) = _UnifediApiInstanceFederationMfrObjectAge;

  factory UnifediApiInstanceFederationMfrObjectAge.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceFederationMfrObjectAgeFromJson(
        json,
      );
}

// ignore: lines_longer_than_80_chars
extension UnifediApiInstanceFederationMfrObjectAgeInterfaceExtension
    on IUnifediApiInstanceFederationMfrObjectAge {
  UnifediApiInstanceFederationMfrObjectAge
      toUnifediApiInstanceFederationMfrObjectAge({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => UnifediApiInstanceFederationMfrObjectAge(
              threshold: threshold,
              actions: actions,
            ),
            forceNewObject: forceNewObject,
          );
}
