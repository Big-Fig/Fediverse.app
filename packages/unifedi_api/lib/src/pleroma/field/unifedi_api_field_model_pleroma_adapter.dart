import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/field/unifedi_api_field_model.dart';

part 'unifedi_api_field_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_field_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiFieldPleromaAdapter
    with _$UnifediApiFieldPleromaAdapter
    implements IUnifediApiField {
  const UnifediApiFieldPleromaAdapter._();
  const factory UnifediApiFieldPleromaAdapter(
    @HiveField(0) PleromaApiField valueField,
  ) = _UnifediApiFieldPleromaAdapter;

  @override
  String? get name => valueField.name;

  @override
  String? get value => valueField.value;

  @override
  DateTime? get verifiedAt => valueField.verifiedAt;
  factory UnifediApiFieldPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFieldPleromaAdapterFromJson(json);
}

extension PleromaApiFieldUnifediExtension on IPleromaApiField {
  UnifediApiFieldPleromaAdapter toUnifediApiFieldPleromaAdapter() =>
      UnifediApiFieldPleromaAdapter(
        toPleromaApiField(),
      );
}

extension PleromaApiFieldUnifediListExtension on List<IPleromaApiField> {
  List<UnifediApiFieldPleromaAdapter> toUnifediApiFieldPleromaAdapterList() =>
      map(
        (item) => item.toUnifediApiFieldPleromaAdapter(),
      ).toList();
}

extension IUnifediApiPaginationPleromaExtension on IUnifediApiField {
  PleromaApiField toPleromaApiField() => PleromaApiField(
        name: name,
        value: value,
        verifiedAt: verifiedAt,
      );
}

extension IUnifediApiPaginationPleromaListExtension on List<IUnifediApiField> {
  List<PleromaApiField> toPleromaApiFieldList() => map(
        (item) => item.toPleromaApiField(),
      ).toList();
}
