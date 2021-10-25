// ignore_for_file: no-magic-number
import 'pleroma_api_push_subscription_alerts_model_impl.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiPushSubscriptionAlertsMockHelper {
  static PleromaApiPushSubscriptionAlerts generate({
    required String seed,
  }) =>
      PleromaApiPushSubscriptionAlerts(
        favourite: seed.hashCode % 2 == 0,
        follow: seed.hashCode % 2 == 1,
        mention: seed.hashCode % 2 == 0,
        reblog: seed.hashCode % 2 == 1,
        poll: seed.hashCode % 2 == 0,
        pleromaChatMention: seed.hashCode % 2 == 1,
        pleromaEmojiReaction: seed.hashCode % 2 == 0,
      );
}
