import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_tag_history_item_model.dart';

part 'unifedi_api_tag_history_item_model_impl.freezed.dart';

part 'unifedi_api_tag_history_item_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiTagHistoryItem
    with _$UnifediApiTagHistoryItem
    implements IUnifediApiTagHistoryItem {
  const factory UnifediApiTagHistoryItem({
    @HiveField(0)
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
        required int accounts,
    @HiveField(1)
    @JsonKey(
      name: 'day',
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
        required int dayInUnixTimestamp,
    @HiveField(2)
    @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt,
    )
        required int uses,
  }) = _UnifediApiTagHistoryItem;

  factory UnifediApiTagHistoryItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTagHistoryItemFromJson(json);
}

extension IUnifediApiTagHistoryItemInterfaceListExtension
    on List<IUnifediApiTagHistoryItem> {
  List<UnifediApiTagHistoryItem> toUnifediApiTagHistoryItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiTagHistoryItem item) => item.toUnifediApiTagHistoryItem(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiTagHistoryItemInterfaceExtension
    on IUnifediApiTagHistoryItem {
  UnifediApiTagHistoryItem toUnifediApiTagHistoryItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiTagHistoryItem(
          accounts: accounts,
          dayInUnixTimestamp: dayInUnixTimestamp,
          uses: uses,
        ),
        forceNewObject: forceNewObject,
      );
}
