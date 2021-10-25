import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/filter/context_type/unifedi_api_filter_context_type_model.dart';
import '../../api/filter/unifedi_api_filter_model.dart';

part 'unifedi_api_filter_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_filter_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiFilterPleromaAdapter
    with _$UnifediApiFilterPleromaAdapter
    implements IUnifediApiFilter {
  const UnifediApiFilterPleromaAdapter._();
  const factory UnifediApiFilterPleromaAdapter(
    @HiveField(0) PleromaApiFilter value,
  ) = _UnifediApiFilterPleromaAdapter;

  @override
  List<String> get context => value.context
      .map(
        (item) => item.toUnifediApiFilterContextType().stringValue,
      )
      .toList();

  @override
  DateTime? get expiresAt => value.expiresAt;

  @override
  String get id => value.id;

  @override
  bool get irreversible => value.irreversible;

  @override
  String get phrase => value.phrase;

  @override
  bool get wholeWord => value.wholeWord;
  factory UnifediApiFilterPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFilterPleromaAdapterFromJson(json);
}

extension PleromaApiFilterUnifediExtension on IPleromaApiFilter {
  UnifediApiFilterPleromaAdapter toUnifediApiFilterPleromaAdapter() =>
      UnifediApiFilterPleromaAdapter(
        toPleromaApiFilter(),
      );
}

extension PleromaApiFilterUnifediListExtension on List<IPleromaApiFilter> {
  List<UnifediApiFilterPleromaAdapter> toUnifediApiFilterPleromaAdapterList() =>
      map(
        (item) => item.toUnifediApiFilterPleromaAdapter(),
      ).toList();
}
