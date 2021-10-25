import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../../api/instance/federation/mfr/object_age/unifedi_api_instance_federation_mfr_object_age_model.dart';

part 'unifedi_api_instance_federation_mfr_object_age_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_federation_mfr_object_age_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceFederationMfrObjectAgePleromaAdapter
    with _$UnifediApiInstanceFederationMfrObjectAgePleromaAdapter
    implements IUnifediApiInstanceFederationMfrObjectAge {
  const UnifediApiInstanceFederationMfrObjectAgePleromaAdapter._();

  const factory UnifediApiInstanceFederationMfrObjectAgePleromaAdapter(
    @HiveField(0) PleromaApiInstanceFederationMfrObjectAge value,
  ) = _UnifediApiInstanceFederationMfrObjectAgePleromaAdapter;

  @override
  List<String>? get actions => value.actions;

  @override
  int? get threshold => value.threshold;

  factory UnifediApiInstanceFederationMfrObjectAgePleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceFederationMfrObjectAgePleromaAdapterFromJson(json);
}

extension PleromaApiInstanceFederationMfrObjectAgeUnifediExtension
    on IPleromaApiInstanceFederationMfrObjectAge {
  UnifediApiInstanceFederationMfrObjectAgePleromaAdapter
      toUnifediApiInstanceFederationMfrObjectAgePleromaAdapter() =>
          UnifediApiInstanceFederationMfrObjectAgePleromaAdapter(
            toPleromaApiInstanceFederationMfrObjectAge(),
          );
}

extension PleromaApiInstanceFederationMfrObjectAgeUnifediListExtension
    on List<IPleromaApiInstanceFederationMfrObjectAge> {
  List<UnifediApiInstanceFederationMfrObjectAgePleromaAdapter>
      toUnifediApiInstanceFederationMfrObjectAgePleromaAdapterList() => map(
            (item) =>
                item.toUnifediApiInstanceFederationMfrObjectAgePleromaAdapter(),
          ).toList();
}

extension UnifediApiInstanceFederationMfrObjectAgePleromaExtension
    on IUnifediApiInstanceFederationMfrObjectAge {
  PleromaApiInstanceFederationMfrObjectAge
      toPleromaApiInstanceFederationMfrObjectAge() =>
          PleromaApiInstanceFederationMfrObjectAge(
            threshold: threshold,
            actions: actions,
          );
}
