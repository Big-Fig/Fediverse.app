import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/instance/federation/mfr/object_age/unifedi_api_instance_federation_mfr_object_age_model.dart';
import '../../../api/instance/federation/unifedi_api_instance_federation_model.dart';
import 'mfr/object_age/unifedi_api_instance_federation_mfr_object_age_model_pleroma_adapter.dart';

part 'unifedi_api_instance_federation_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_federation_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceFederationPleromaAdapter
    with _$UnifediApiInstanceFederationPleromaAdapter
    implements IUnifediApiInstanceFederation {
  const UnifediApiInstanceFederationPleromaAdapter._();

  const factory UnifediApiInstanceFederationPleromaAdapter(
    @HiveField(0) PleromaApiInstanceFederation value,
  ) = _UnifediApiInstanceFederationPleromaAdapter;

  @override
  bool? get enabled => value.enabled;

  @override
  bool? get exclusions => value.exclusions;

  @override
  IUnifediApiInstanceFederationMfrObjectAge? get mrfObjectAge =>
      value.mrfObjectAge
          ?.toUnifediApiInstanceFederationMfrObjectAgePleromaAdapter();

  @override
  List<String>? get mrfPolicies => value.mrfPolicies;

  @override
  List<String>? get quarantinedInstances => value.quarantinedInstances;

  factory UnifediApiInstanceFederationPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceFederationPleromaAdapterFromJson(json);
}

extension PleromaApiInstanceFederationUnifediExtension
    on IPleromaApiInstanceFederation {
  UnifediApiInstanceFederationPleromaAdapter
      toUnifediApiInstanceFederationPleromaAdapter() =>
          UnifediApiInstanceFederationPleromaAdapter(
            toPleromaApiInstanceFederation(),
          );
}

extension PleromaApiInstanceFederationUnifediListExtension
    on List<IPleromaApiInstanceFederation> {
  List<UnifediApiInstanceFederationPleromaAdapter>
      toUnifediApiInstanceFederationPleromaAdapterList() => map(
            (item) => item.toUnifediApiInstanceFederationPleromaAdapter(),
          ).toList();
}

extension UnifediApiInstanceFederationPleromaExtension
    on IUnifediApiInstanceFederation {
  PleromaApiInstanceFederation toPleromaApiInstanceFederation() =>
      PleromaApiInstanceFederation(
        enabled: enabled,
        exclusions: exclusions,
        mrfObjectAge:
            mrfObjectAge?.toPleromaApiInstanceFederationMfrObjectAge(),
        mrfPolicies: mrfPolicies,
        quarantinedInstances: quarantinedInstances,
      );
}
