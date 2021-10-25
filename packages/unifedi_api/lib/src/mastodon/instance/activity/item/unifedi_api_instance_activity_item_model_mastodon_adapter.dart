import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../../../api/instance/activity/item/unifedi_api_instance_activity_item_model.dart';

part 'unifedi_api_instance_activity_item_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_instance_activity_item_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceActivityItemMastodonAdapter
    with _$UnifediApiInstanceActivityItemMastodonAdapter
    implements IUnifediApiInstanceActivityItem {
  const UnifediApiInstanceActivityItemMastodonAdapter._();
  const factory UnifediApiInstanceActivityItemMastodonAdapter(
    @HiveField(0) MastodonApiInstanceActivityItem value,
  ) = _UnifediApiInstanceActivityItemMastodonAdapter;

  @override
  int get logins => value.logins;

  @override
  int get registrations => value.registrations;

  @override
  int get statuses => value.statuses;

  @override
  int get week => value.week;
  factory UnifediApiInstanceActivityItemMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceActivityItemMastodonAdapterFromJson(json);
}

extension MastodonApiInstanceActivityItemUnifediExtension
    on IMastodonApiInstanceActivityItem {
  UnifediApiInstanceActivityItemMastodonAdapter
      toUnifediApiInstanceActivityItemMastodonAdapter() =>
          UnifediApiInstanceActivityItemMastodonAdapter(
            toMastodonApiInstanceActivityItem(),
          );
}

extension MastodonApiInstanceActivityItemUnifediListExtension
    on List<IMastodonApiInstanceActivityItem> {
  List<UnifediApiInstanceActivityItemMastodonAdapter>
      toUnifediApiInstanceActivityItemMastodonAdapterList() => map(
            (item) => item.toUnifediApiInstanceActivityItemMastodonAdapter(),
          ).toList();
}
