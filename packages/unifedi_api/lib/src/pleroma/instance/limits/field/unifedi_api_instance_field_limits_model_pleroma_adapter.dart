import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/instance/limits/field/unifedi_api_instance_field_limits_model.dart';

part 'unifedi_api_instance_field_limits_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_field_limits_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceFieldLimitsPleromaAdapter
    with _$UnifediApiInstanceFieldLimitsPleromaAdapter
    implements IUnifediApiInstanceFieldLimits {
  const UnifediApiInstanceFieldLimitsPleromaAdapter._();

  const factory UnifediApiInstanceFieldLimitsPleromaAdapter(
    @HiveField(0) PleromaApiInstanceFieldLimits value,
  ) = _UnifediApiInstanceFieldLimitsPleromaAdapter;

  @override
  int? get maxFields => value.maxFields;

  @override
  int? get maxRemoteFields => value.maxRemoteFields;

  @override
  int? get nameLength => value.nameLength;

  @override
  int? get valueLength => value.valueLength;

  factory UnifediApiInstanceFieldLimitsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceFieldLimitsPleromaAdapterFromJson(json);
}

extension PleromaApiInstanceFieldLimitsUnifediExtension
    on IPleromaApiInstanceFieldLimits {
  UnifediApiInstanceFieldLimitsPleromaAdapter
      toUnifediApiInstanceFieldLimitsPleromaAdapter() =>
          UnifediApiInstanceFieldLimitsPleromaAdapter(
            toPleromaApiInstanceFieldLimits(),
          );
}

extension PleromaApiInstanceFieldLimitsUnifediListExtension
    on List<IPleromaApiInstanceFieldLimits> {
  List<UnifediApiInstanceFieldLimitsPleromaAdapter>
      toUnifediApiInstanceFieldLimitsPleromaAdapterList() => map(
            (item) => item.toUnifediApiInstanceFieldLimitsPleromaAdapter(),
          ).toList();
}

extension UnifediApiInstanceFieldLimitsPleromaExtension
    on IUnifediApiInstanceFieldLimits {
  PleromaApiInstanceFieldLimits toPleromaApiInstanceFieldLimits() =>
      PleromaApiInstanceFieldLimits(
        maxFields: maxFields,
        maxRemoteFields: maxRemoteFields,
        nameLength: nameLength,
        valueLength: valueLength,
      );
}
