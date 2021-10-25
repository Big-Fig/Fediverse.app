import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'item/unifedi_api_tag_history_item_model_impl.dart';
import 'unifedi_api_tag_history_model.dart';

part 'unifedi_api_tag_history_model_impl.freezed.dart';

part 'unifedi_api_tag_history_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiTagHistory
    with _$UnifediApiTagHistory
    implements IUnifediApiTagHistory {
  const factory UnifediApiTagHistory({
    @HiveField(0) required List<UnifediApiTagHistoryItem> items,
  }) = _UnifediApiTagHistory;

  factory UnifediApiTagHistory.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTagHistoryFromJson(json);
}

extension IUnifediApiTagHistoryInterfaceListExtension
    on List<IUnifediApiTagHistory> {
  List<UnifediApiTagHistory> toUnifediApiTagHistoryList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiTagHistory item) => item.toUnifediApiTagHistory(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiTagHistoryInterfaceExtension on IUnifediApiTagHistory {
  UnifediApiTagHistory toUnifediApiTagHistory({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiTagHistory(
          items: items.toUnifediApiTagHistoryItemList(),
        ),
        forceNewObject: forceNewObject,
      );
}
