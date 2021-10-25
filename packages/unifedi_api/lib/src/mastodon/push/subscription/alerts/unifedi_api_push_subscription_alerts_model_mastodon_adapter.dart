import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/push/subscription/alerts/unifedi_api_push_subscription_alerts_model.dart';

part 'unifedi_api_push_subscription_alerts_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_push_subscription_alerts_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushSubscriptionAlertsMastodonAdapter
    with _$UnifediApiPushSubscriptionAlertsMastodonAdapter
    implements IUnifediApiPushSubscriptionAlerts {
  const UnifediApiPushSubscriptionAlertsMastodonAdapter._();
  const factory UnifediApiPushSubscriptionAlertsMastodonAdapter(
    @HiveField(0) MastodonApiPushSubscriptionAlerts value,
  ) = _UnifediApiPushSubscriptionAlertsMastodonAdapter;

  @override
  bool? get chatMention => null;

  @override
  bool? get emojiReaction => null;

  @override
  bool? get favourite => value.favourite;

  @override
  bool? get follow => value.follow;

  @override
  bool? get mention => value.mention;

  @override
  bool? get poll => value.poll;

  @override
  bool? get reblog => value.reblog;
  factory UnifediApiPushSubscriptionAlertsMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionAlertsMastodonAdapterFromJson(json);
}

extension UnifediApiPushSubscriptionAlertsMastodonExtension
    on IUnifediApiPushSubscriptionAlerts {
  MastodonApiPushSubscriptionAlerts toMastodonApiPushSubscriptionAlerts() =>
      MastodonApiPushSubscriptionAlerts(
        favourite: favourite,
        follow: follow,
        mention: mention,
        reblog: reblog,
        poll: poll,
      );
}

extension MastodonApiPushSubscriptionAlertsUnifediExtension
    on IMastodonApiPushSubscriptionAlerts {
  UnifediApiPushSubscriptionAlertsMastodonAdapter
      toUnifediApiPushSubscriptionAlertsMastodonAdapter() =>
          UnifediApiPushSubscriptionAlertsMastodonAdapter(
            toMastodonApiPushSubscriptionAlerts(),
          );
}

extension MastodonApiPushSubscriptionAlertsUnifediListExtension
    on List<IMastodonApiPushSubscriptionAlerts> {
  List<UnifediApiPushSubscriptionAlertsMastodonAdapter>
      toUnifediApiPushSubscriptionAlertsMastodonAdapterList() => map(
            (item) => item.toUnifediApiPushSubscriptionAlertsMastodonAdapter(),
          ).toList();
}
