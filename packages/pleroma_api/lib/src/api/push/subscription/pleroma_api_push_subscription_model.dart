import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';
import 'alerts/pleroma_api_push_subscription_alerts_model.dart';

abstract class IPleromaApiPushSubscription
    implements IMastodonApiPushSubscription, IPleromaApiResponse {
  @override
  IPleromaApiPushSubscriptionAlerts get alerts;
}
