// ignore_for_file: no-magic-number
import 'pleroma_api_push_subscription_keys_model_impl.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiPushSubscriptionKeysMockHelper {
  static PleromaApiPushSubscriptionKeys generate({
    required String seed,
  }) =>
      PleromaApiPushSubscriptionKeys(
        p256dh: seed + 'p256dh',
        auth: seed + 'auth',
      );
}
