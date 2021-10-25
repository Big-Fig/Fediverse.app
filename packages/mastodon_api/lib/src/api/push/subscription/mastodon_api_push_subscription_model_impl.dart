import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'alerts/mastodon_api_push_subscription_alerts_model_impl.dart';
import 'mastodon_api_push_subscription_model.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_push_subscription_model_impl.freezed.dart';

part 'mastodon_api_push_subscription_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiPushSubscription
    with _$MastodonApiPushSubscription
    implements IMastodonApiPushSubscription {
  const factory MastodonApiPushSubscription({
    @JsonKey(fromJson: JsonParseHelper.toStringFromAny)
    @HiveField(0)
        required String id,
    @HiveField(1) required String endpoint,
    @HiveField(2) required MastodonApiPushSubscriptionAlerts alerts,
    @HiveField(3) @JsonKey(name: 'server_key') required String serverKey,
  }) = _MastodonApiPushSubscription;

  factory MastodonApiPushSubscription.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiPushSubscriptionFromJson(json);
}

extension IMastodonApiPushSubscriptionInterfaceExtension
    on IMastodonApiPushSubscription {
  MastodonApiPushSubscription toMastodonApiPushSubscription({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPushSubscription(
          id: id,
          endpoint: endpoint,
          alerts: alerts.toMastodonApiPushSubscriptionAlerts(
            forceNewObject: forceNewObject,
          ),
          serverKey: serverKey,
        ),
        forceNewObject: forceNewObject,
      );
}
