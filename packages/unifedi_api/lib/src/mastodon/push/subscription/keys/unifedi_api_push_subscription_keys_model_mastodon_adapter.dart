import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/push/subscription/keys/unifedi_api_push_subscription_keys_model.dart';

part 'unifedi_api_push_subscription_keys_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_push_subscription_keys_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPushSubscriptionKeysMastodonAdapter
    with _$UnifediApiPushSubscriptionKeysMastodonAdapter
    implements IUnifediApiPushSubscriptionKeys {
  const UnifediApiPushSubscriptionKeysMastodonAdapter._();
  const factory UnifediApiPushSubscriptionKeysMastodonAdapter(
    @HiveField(0) MastodonApiPushSubscriptionKeys value,
  ) = _UnifediApiPushSubscriptionKeysMastodonAdapter;

  @override
  String get auth => value.auth;

  @override
  String get p256dh => value.p256dh;
  factory UnifediApiPushSubscriptionKeysMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPushSubscriptionKeysMastodonAdapterFromJson(json);
}

extension MastodonApiPushSubscriptionKeysUnifediExtension
    on IMastodonApiPushSubscriptionKeys {
  UnifediApiPushSubscriptionKeysMastodonAdapter
      toUnifediApiPushSubscriptionKeysMastodonAdapter() =>
          UnifediApiPushSubscriptionKeysMastodonAdapter(
            toMastodonApiPushSubscriptionKeys(),
          );
}

extension UnifediApiPushSubscriptionKeysMastodonExtension
    on IUnifediApiPushSubscriptionKeys {
  MastodonApiPushSubscriptionKeys toMastodonApiPushSubscriptionKeys() =>
      MastodonApiPushSubscriptionKeys(
        p256dh: p256dh,
        auth: auth,
      );
}

extension MastodonApiPushSubscriptionKeysUnifediListExtension
    on List<IMastodonApiPushSubscriptionKeys> {
  List<UnifediApiPushSubscriptionKeysMastodonAdapter>
      toUnifediApiPushSubscriptionKeysMastodonAdapterList() => map(
            (item) => item.toUnifediApiPushSubscriptionKeysMastodonAdapter(),
          ).toList();
}
