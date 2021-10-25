// ignore_for_file: no-magic-number
import 'mastodon_api_push_subscription_keys_model_impl.dart';

// ignore_for_file: no-equal-arguments

class MastodonApiPushSubscriptionKeysMockHelper {
  static MastodonApiPushSubscriptionKeys generate({
    required String seed,
  }) =>
      MastodonApiPushSubscriptionKeys(
        p256dh: seed + 'p256dh',
        auth: seed + 'auth',
      );
}
