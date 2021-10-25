import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/tag/history/unifedi_api_tag_history_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';
import 'history/unifedi_api_tag_history_model_pleroma_adapter.dart';

part 'unifedi_api_tag_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_tag_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiTagPleromaAdapter
    with _$UnifediApiTagPleromaAdapter
    implements IUnifediApiTag {
  const UnifediApiTagPleromaAdapter._();

  const factory UnifediApiTagPleromaAdapter(
    @HiveField(0) PleromaApiTag value,
  ) = _UnifediApiTagPleromaAdapter;

  @override
  IUnifediApiTagHistory? get history =>
      value.history?.toUnifediApiTagHistoryPleromaAdapter();

  @override
  String get name => value.name;

  @override
  String get url => value.url;

  @override
  String? get id => null;

  @override
  DateTime? get lastStatusAt => null;

  @override
  // ignore: avoid_returning_null
  int? get statusesCount => null;

  factory UnifediApiTagPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTagPleromaAdapterFromJson(json);
}

extension PleromaApiTagUnifediExtension on IPleromaApiTag {
  UnifediApiTagPleromaAdapter toUnifediApiTagPleromaAdapter() =>
      UnifediApiTagPleromaAdapter(
        toPleromaApiTag(),
      );
}

extension PleromaApiTagUnifediListExtension on List<IPleromaApiTag> {
  List<UnifediApiTagPleromaAdapter> toUnifediApiTagPleromaAdapterList() => map(
        (item) => item.toUnifediApiTagPleromaAdapter(),
      ).toList();
}

extension UnifediApiTagPleromaExtension on IUnifediApiTag {
  PleromaApiTag toPleromaApiTag() => PleromaApiTag(
        name: name,
        // ignore:avoid-non-null-assertion
        url: url!,
        history: history?.items.toPleromaApiTagHistoryItemList(),
      );
}

extension UnifediApiTagPleromaListExtension on List<IUnifediApiTag> {
  List<PleromaApiTag> toPleromaApiTagList() => map(
        (item) => item.toPleromaApiTag(),
      ).toList();
}
