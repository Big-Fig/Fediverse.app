import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/tag/history/item/unifedi_api_tag_history_item_model.dart';
import '../../../api/tag/history/unifedi_api_tag_history_model.dart';

part 'unifedi_api_tag_history_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_tag_history_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiTagHistoryMastodonAdapter
    with _$UnifediApiTagHistoryMastodonAdapter
    implements IUnifediApiTagHistory {
  const UnifediApiTagHistoryMastodonAdapter._();
  const factory UnifediApiTagHistoryMastodonAdapter(
    @HiveField(0) List<MastodonApiTagHistoryItem> value,
  ) = _UnifediApiTagHistoryMastodonAdapter;

  @override
  List<IUnifediApiTagHistoryItem> get items =>
      value.toUnifediApiTagHistoryItemMastodonAdapterList();
  factory UnifediApiTagHistoryMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTagHistoryMastodonAdapterFromJson(json);
}

extension MastodonApiTagHistoryUnifediExtension
    on List<IMastodonApiTagHistoryItem> {
  UnifediApiTagHistoryMastodonAdapter toUnifediApiTagHistoryMastodonAdapter() =>
      UnifediApiTagHistoryMastodonAdapter(
        toMastodonApiTagHistoryItemList(),
      );
}

@freezed
@HiveType(typeId: 0)
class UnifediApiTagHistoryItemMastodonAdapter
    with _$UnifediApiTagHistoryItemMastodonAdapter
    implements IUnifediApiTagHistoryItem {
  const UnifediApiTagHistoryItemMastodonAdapter._();
  const factory UnifediApiTagHistoryItemMastodonAdapter(
    @HiveField(0) MastodonApiTagHistoryItem value,
  ) = _UnifediApiTagHistoryItemMastodonAdapter;

  @override
  int get accounts => value.accounts;

  @override
  int get dayInUnixTimestamp => value.dayInUnixTimestamp;

  @override
  int get uses => value.uses;
  factory UnifediApiTagHistoryItemMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTagHistoryItemMastodonAdapterFromJson(json);
}

extension MastodonApiTagHistoryItemUnifediExtension
    on IMastodonApiTagHistoryItem {
  UnifediApiTagHistoryItemMastodonAdapter
      toUnifediApiTagHistoryItemMastodonAdapter() =>
          UnifediApiTagHistoryItemMastodonAdapter(
            toMastodonApiTagHistoryItem(),
          );
}

extension MastodonApiTagHistoryItemUnifediListExtension
    on List<IMastodonApiTagHistoryItem> {
  List<UnifediApiTagHistoryItemMastodonAdapter>
      toUnifediApiTagHistoryItemMastodonAdapterList() => map(
            (item) => item.toUnifediApiTagHistoryItemMastodonAdapter(),
          ).toList();
}
