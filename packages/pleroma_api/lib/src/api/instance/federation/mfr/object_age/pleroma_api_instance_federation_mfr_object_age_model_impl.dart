import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_instance_federation_mfr_object_age_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_instance_federation_mfr_object_age_model_impl.freezed.dart';

part 'pleroma_api_instance_federation_mfr_object_age_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiInstanceFederationMfrObjectAge
    with _$PleromaApiInstanceFederationMfrObjectAge
    implements IPleromaApiInstanceFederationMfrObjectAge {
  const factory PleromaApiInstanceFederationMfrObjectAge({
    @HiveField(0) required int? threshold,
    @HiveField(1) required List<String>? actions,
  }) = _PleromaApiInstanceFederationMfrObjectAge;

  factory PleromaApiInstanceFederationMfrObjectAge.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstanceFederationMfrObjectAgeFromJson(
        json,
      );
}

// ignore: lines_longer_than_80_chars
extension PleromaApiInstanceFederationMfrObjectAgeInterfaceExtension
    on IPleromaApiInstanceFederationMfrObjectAge {
  PleromaApiInstanceFederationMfrObjectAge
      toPleromaApiInstanceFederationMfrObjectAge({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiInstanceFederationMfrObjectAge(
              threshold: threshold,
              actions: actions,
            ),
            forceNewObject: forceNewObject,
          );
}
