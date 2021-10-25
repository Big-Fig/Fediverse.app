import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'mfr/object_age/unifedi_api_instance_federation_mfr_object_age_model_impl.dart';
import 'unifedi_api_instance_federation_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_federation_model_impl.freezed.dart';
part 'unifedi_api_instance_federation_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstanceFederation
    with _$UnifediApiInstanceFederation
    implements IUnifediApiInstanceFederation {
  const factory UnifediApiInstanceFederation({
    @HiveField(0) required bool? enabled,
    @HiveField(1) required bool? exclusions,
    @HiveField(2)
    @JsonKey(name: 'mrf_object_age')
        required UnifediApiInstanceFederationMfrObjectAge? mrfObjectAge,
    @HiveField(3)
    @JsonKey(name: 'mrf_policies')
        required List<String>? mrfPolicies,
    @HiveField(4)
    @JsonKey(name: 'quarantined_instances')
        required List<String>? quarantinedInstances,
  }) = _UnifediApiInstanceFederation;

  factory UnifediApiInstanceFederation.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceFederationFromJson(json);
}

extension UnifediApiInstanceFederationInterfaceExtension
    on IUnifediApiInstanceFederation {
  UnifediApiInstanceFederation toUnifediApiInstanceFederation({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceFederation(
          enabled: enabled,
          exclusions: exclusions,
          mrfObjectAge: mrfObjectAge
              // ignore: lines_longer_than_80_chars
              ?.toUnifediApiInstanceFederationMfrObjectAge(
            forceNewObject: forceNewObject,
          ),
          mrfPolicies: mrfPolicies,
          quarantinedInstances: quarantinedInstances,
        ),
        forceNewObject: forceNewObject,
      );
}
