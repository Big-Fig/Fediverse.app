import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/tag/history/item/unifedi_api_tag_history_item_model.dart';
import '../../../api/tag/history/unifedi_api_tag_history_model.dart';

part 'unifedi_api_tag_history_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_tag_history_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiTagHistoryPleromaAdapter
    with _$UnifediApiTagHistoryPleromaAdapter
    implements IUnifediApiTagHistory {
  const UnifediApiTagHistoryPleromaAdapter._();

  const factory UnifediApiTagHistoryPleromaAdapter(
    @HiveField(0) List<PleromaApiTagHistoryItem> value,
  ) = _UnifediApiTagHistoryPleromaAdapter;

  @override
  List<IUnifediApiTagHistoryItem> get items =>
      value.toUnifediApiTagHistoryItemPleromaAdapterList();

  factory UnifediApiTagHistoryPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTagHistoryPleromaAdapterFromJson(json);
}

extension PleromaApiTagHistoryUnifediExtension
    on List<IPleromaApiTagHistoryItem> {
  UnifediApiTagHistoryPleromaAdapter toUnifediApiTagHistoryPleromaAdapter() =>
      UnifediApiTagHistoryPleromaAdapter(
        toPleromaApiTagHistoryItemList(),
      );
}

@freezed
@HiveType(typeId: 0)
class UnifediApiTagHistoryItemPleromaAdapter
    with _$UnifediApiTagHistoryItemPleromaAdapter
    implements IUnifediApiTagHistoryItem {
  const UnifediApiTagHistoryItemPleromaAdapter._();

  const factory UnifediApiTagHistoryItemPleromaAdapter(
    @HiveField(0) PleromaApiTagHistoryItem value,
  ) = _UnifediApiTagHistoryItemPleromaAdapter;

  @override
  int get accounts => value.accounts;

  @override
  int get dayInUnixTimestamp => value.dayInUnixTimestamp;

  @override
  int get uses => value.uses;

  factory UnifediApiTagHistoryItemPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTagHistoryItemPleromaAdapterFromJson(json);
}

extension PleromaApiTagHistoryItemUnifediExtension
    on IPleromaApiTagHistoryItem {
  UnifediApiTagHistoryItemPleromaAdapter
      toUnifediApiTagHistoryItemPleromaAdapter() =>
          UnifediApiTagHistoryItemPleromaAdapter(
            toPleromaApiTagHistoryItem(),
          );
}

extension PleromaApiTagHistoryItemUnifediListExtension
    on List<IPleromaApiTagHistoryItem> {
  List<UnifediApiTagHistoryItemPleromaAdapter>
      toUnifediApiTagHistoryItemPleromaAdapterList() => map(
            (item) => item.toUnifediApiTagHistoryItemPleromaAdapter(),
          ).toList();
}

extension UnifediApiTagHistoryItemPleromaExtension
    on IUnifediApiTagHistoryItem {
  PleromaApiTagHistoryItem toPleromaApiTagHistoryItem() =>
      PleromaApiTagHistoryItem(
        accounts: accounts,
        dayInUnixTimestamp: dayInUnixTimestamp,
        uses: uses,
      );
}

extension UnifediApiTagHistoryItemPleromaListExtension
    on List<IUnifediApiTagHistoryItem> {
  List<PleromaApiTagHistoryItem> toPleromaApiTagHistoryItemList() => map(
        (item) => item.toPleromaApiTagHistoryItem(),
      ).toList();
}
