import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/push/subscription/alerts/unifedi_api_push_subscription_alerts_model.dart';
import '../../../api/push/subscription/unifedi_api_push_subscription_model.dart';
import 'alerts/unifedi_api_push_subscription_alerts_model_mastodon_adapter.dart';

part 'unifedi_api_push_subscription_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_push_subscription_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushSubscriptionMastodonAdapter
    with _$UnifediApiPushSubscriptionMastodonAdapter
    implements IUnifediApiPushSubscription {
  const UnifediApiPushSubscriptionMastodonAdapter._();
  const factory UnifediApiPushSubscriptionMastodonAdapter(
    @HiveField(0) MastodonApiPushSubscription value,
  ) = _UnifediApiPushSubscriptionMastodonAdapter;

  @override
  IUnifediApiPushSubscriptionAlerts get alerts =>
      value.alerts.toUnifediApiPushSubscriptionAlertsMastodonAdapter();

  @override
  String get endpoint => value.endpoint;

  @override
  String get id => value.id;

  @override
  String get serverKey => value.serverKey;
  factory UnifediApiPushSubscriptionMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionMastodonAdapterFromJson(json);
}

extension MastodonApiPushSubscriptionUnifediExtension
    on IMastodonApiPushSubscription {
  UnifediApiPushSubscriptionMastodonAdapter
      toUnifediApiPushSubscriptionMastodonAdapter() =>
          UnifediApiPushSubscriptionMastodonAdapter(
            toMastodonApiPushSubscription(),
          );
}

extension MastodonApiPushSubscriptionUnifediListExtension
    on List<IMastodonApiPushSubscription> {
  List<UnifediApiPushSubscriptionMastodonAdapter>
      toUnifediApiPushSubscriptionMastodonAdapterList() => map(
            (item) => item.toUnifediApiPushSubscriptionMastodonAdapter(),
          ).toList();
}
