import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_tag_history_item_model.dart';

part 'pleroma_api_tag_history_item_model_impl.freezed.dart';

part 'pleroma_api_tag_history_item_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiTagHistoryItem
    with _$PleromaApiTagHistoryItem
    implements IPleromaApiTagHistoryItem {
  const factory PleromaApiTagHistoryItem({
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
  }) = _PleromaApiTagHistoryItem;

  factory PleromaApiTagHistoryItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiTagHistoryItemFromJson(json);
}

extension IPleromaApiTagHistoryItemInterfaceListExtension
    on List<IPleromaApiTagHistoryItem> {
  List<PleromaApiTagHistoryItem> toPleromaApiTagHistoryItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiTagHistoryItem item) => item.toPleromaApiTagHistoryItem(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiTagHistoryItemInterfaceExtension
    on IPleromaApiTagHistoryItem {
  PleromaApiTagHistoryItem toPleromaApiTagHistoryItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiTagHistoryItem(
          accounts: accounts,
          dayInUnixTimestamp: dayInUnixTimestamp,
          uses: uses,
        ),
        forceNewObject: forceNewObject,
      );
}
