import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_tag_history_item_model.dart';

part 'mastodon_api_tag_history_item_model_impl.freezed.dart';

part 'mastodon_api_tag_history_item_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class MastodonApiTagHistoryItem
    with _$MastodonApiTagHistoryItem
    implements IMastodonApiTagHistoryItem {
  const factory MastodonApiTagHistoryItem({
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
  }) = _MastodonApiTagHistoryItem;

  factory MastodonApiTagHistoryItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiTagHistoryItemFromJson(json);
}

extension IMastodonApiTagHistoryItemInterfaceListExtension
    on List<IMastodonApiTagHistoryItem> {
  List<MastodonApiTagHistoryItem> toMastodonApiTagHistoryItemList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiTagHistoryItem item) => item.toMastodonApiTagHistoryItem(
          forceNewObject: forceNewObject,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiTagHistoryItemInterfaceExtension
    on IMastodonApiTagHistoryItem {
  MastodonApiTagHistoryItem toMastodonApiTagHistoryItem({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiTagHistoryItem(
          accounts: accounts,
          dayInUnixTimestamp: dayInUnixTimestamp,
          uses: uses,
        ),
        forceNewObject: forceNewObject,
      );
}
