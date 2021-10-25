import '../../mastodon_api_model.dart';
import 'alerts/mastodon_api_push_subscription_alerts_model.dart';

abstract class IMastodonApiPushSubscription implements IMastodonApiResponse {
  String get id;

  String get endpoint;

  IMastodonApiPushSubscriptionAlerts get alerts;

  String get serverKey;
}
