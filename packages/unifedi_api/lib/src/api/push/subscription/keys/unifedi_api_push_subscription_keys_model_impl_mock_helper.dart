// ignore_for_file: no-magic-number
import 'unifedi_api_push_subscription_keys_model_impl.dart';

// ignore_for_file: no-equal-arguments

class UnifediApiPushSubscriptionKeysMockHelper {
  static UnifediApiPushSubscriptionKeys generate({
    required String seed,
  }) =>
      UnifediApiPushSubscriptionKeys(
        p256dh: seed + 'p256dh',
        auth: seed + 'auth',
      );
}
