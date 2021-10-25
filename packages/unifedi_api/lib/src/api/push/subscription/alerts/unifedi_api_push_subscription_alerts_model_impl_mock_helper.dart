// ignore_for_file: no-magic-number
import 'unifedi_api_push_subscription_alerts_model_impl.dart';

// ignore_for_file: no-equal-arguments

class UnifediApiPushSubscriptionAlertsMockHelper {
  static UnifediApiPushSubscriptionAlerts generate({
    required String seed,
  }) =>
      UnifediApiPushSubscriptionAlerts(
        favourite: seed.hashCode % 2 == 0,
        follow: seed.hashCode % 2 == 1,
        mention: seed.hashCode % 2 == 0,
        reblog: seed.hashCode % 2 == 1,
        poll: seed.hashCode % 2 == 0,
        chatMention: seed.hashCode % 2 == 1,
        emojiReaction: seed.hashCode % 2 == 0,
      );
}
