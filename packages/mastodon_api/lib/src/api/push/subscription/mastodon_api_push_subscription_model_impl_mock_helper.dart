// ignore_for_file: no-magic-number
import 'alerts/mastodon_api_push_subscription_alerts_model_impl_mock_helper.dart';
import 'mastodon_api_push_subscription_model_impl.dart';

// ignore_for_file: no-equal-arguments

class MastodonApiPushSubscriptionMockHelper {
  static MastodonApiPushSubscription generate({
    required String seed,
  }) =>
      MastodonApiPushSubscription(
        id: seed + 'id',
        endpoint: seed + 'endpoint',
        alerts: MastodonApiPushSubscriptionAlertsMockHelper.generate(
          seed: seed + 'alerts',
        ),
        serverKey: seed + 'serverKey',
      );
}
