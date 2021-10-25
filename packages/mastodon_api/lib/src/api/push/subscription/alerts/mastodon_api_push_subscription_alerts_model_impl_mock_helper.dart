// ignore_for_file: no-magic-number
import 'mastodon_api_push_subscription_alerts_model_impl.dart';

// ignore_for_file: no-equal-arguments

class MastodonApiPushSubscriptionAlertsMockHelper {
  static MastodonApiPushSubscriptionAlerts generate({
    required String seed,
  }) =>
      MastodonApiPushSubscriptionAlerts(
        favourite: seed.hashCode % 2 == 0,
        follow: seed.hashCode % 2 == 1,
        mention: seed.hashCode % 2 == 0,
        reblog: seed.hashCode % 2 == 1,
        poll: seed.hashCode % 2 == 0,
      );
}
