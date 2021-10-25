import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_push_subscription_alerts_model.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_push_subscription_alerts_model_impl.freezed.dart';

part 'mastodon_api_push_subscription_alerts_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiPushSubscriptionAlerts
    with _$MastodonApiPushSubscriptionAlerts
    implements IMastodonApiPushSubscriptionAlerts {
  const factory MastodonApiPushSubscriptionAlerts({
    @HiveField(0) required bool? favourite,
    @HiveField(1) required bool? follow,
    @HiveField(2) required bool? mention,
    @HiveField(3) required bool? reblog,
    @HiveField(4) required bool? poll,
  }) = _MastodonApiPushSubscribeRequestDataAlerts;

  factory MastodonApiPushSubscriptionAlerts.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiPushSubscriptionAlertsFromJson(json);
}

extension IMastodonApiPushSubscriptionAlertsInterfaceExtension
    on IMastodonApiPushSubscriptionAlerts {
  MastodonApiPushSubscriptionAlerts toMastodonApiPushSubscriptionAlerts({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPushSubscriptionAlerts(
          favourite: favourite,
          follow: follow,
          mention: mention,
          reblog: reblog,
          poll: poll,
        ),
        forceNewObject: forceNewObject,
      );
}
