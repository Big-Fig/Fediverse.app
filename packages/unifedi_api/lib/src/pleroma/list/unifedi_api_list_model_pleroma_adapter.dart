import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/list/unifedi_api_list_model.dart';
import 'replies_policy_type/unifedi_api_list_replies_policy_type_sealed_pleroma_converter.dart';

part 'unifedi_api_list_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_list_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiListPleromaAdapter
    with _$UnifediApiListPleromaAdapter
    implements IUnifediApiList {
  const UnifediApiListPleromaAdapter._();
  const factory UnifediApiListPleromaAdapter(
    @HiveField(0) PleromaApiList value,
  ) = _UnifediApiListPleromaAdapter;

  @override
  String get id => value.id;

  @override
  String get title => value.title;

  @override
  String? get repliesPolicy => value.repliesPolicyAsPleromaApi
      ?.toUnifediApiListRepliesPolicyType()
      .stringValue;
  factory UnifediApiListPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiListPleromaAdapterFromJson(json);
}

extension PleromaApiListUnifediExtension on IPleromaApiList {
  UnifediApiListPleromaAdapter toUnifediApiListPleromaAdapter() =>
      UnifediApiListPleromaAdapter(
        toPleromaApiList(),
      );
}

extension PleromaApiListUnifediListExtension on List<IPleromaApiList> {
  List<UnifediApiListPleromaAdapter> toUnifediApiListPleromaAdapterList() =>
      map(
        (item) => item.toUnifediApiListPleromaAdapter(),
      ).toList();
}
