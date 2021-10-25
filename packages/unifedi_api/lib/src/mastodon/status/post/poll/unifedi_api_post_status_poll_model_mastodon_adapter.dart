import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../../../api/status/post/poll/unifedi_api_post_status_poll_model.dart';

part 'unifedi_api_post_status_poll_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_post_status_poll_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPostStatusPollMastodonAdapter
    with _$UnifediApiPostStatusPollMastodonAdapter
    implements IUnifediApiPostStatusPoll {
  const UnifediApiPostStatusPollMastodonAdapter._();
  const factory UnifediApiPostStatusPollMastodonAdapter(
    @HiveField(0) MastodonApiPostStatusPoll value,
  ) = _UnifediApiPostStatusPollMastodonAdapter;

  @override
  int get expiresInSeconds => value.expiresInSeconds;

  @override
  bool get hideTotals => value.hideTotals;

  @override
  bool get multiple => value.multiple;

  @override
  List<String> get options => value.options;

  factory UnifediApiPostStatusPollMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPostStatusPollMastodonAdapterFromJson(json);
}

extension MastodonApiPostStatusPollUnifediExtension
    on IMastodonApiPostStatusPoll {
  UnifediApiPostStatusPollMastodonAdapter
      toUnifediApiPostStatusPollMastodonAdapter() =>
          UnifediApiPostStatusPollMastodonAdapter(
            toMastodonApiPostStatusPoll(),
          );
}

extension IUnifediApiPostStatusPollMastodonExtension
    on IUnifediApiPostStatusPoll {
  MastodonApiPostStatusPoll toMastodonApiPostStatusPoll() =>
      MastodonApiPostStatusPoll(
        expiresInSeconds: expiresInSeconds,
        hideTotals: hideTotals,
        multiple: multiple,
        options: options,
      );
}

extension MastodonApiPostStatusPollUnifediListExtension
    on List<IMastodonApiPostStatusPoll> {
  List<UnifediApiPostStatusPollMastodonAdapter>
      toUnifediApiPostStatusPollMastodonAdapterList() => map(
            (item) => item.toUnifediApiPostStatusPollMastodonAdapter(),
          ).toList();
}
