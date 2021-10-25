// ignore_for_file: no-magic-number
import 'alerts/unifedi_api_push_subscription_alerts_model_impl_mock_helper.dart';
import 'unifedi_api_push_subscription_model_impl.dart';

// ignore_for_file: no-equal-arguments

class UnifediApiPushSubscriptionMockHelper {
  static UnifediApiPushSubscription generate({
    required String seed,
  }) =>
      UnifediApiPushSubscription(
        id: seed + 'id',
        endpoint: seed + 'endpoint',
        alerts: UnifediApiPushSubscriptionAlertsMockHelper.generate(
          seed: seed + 'alerts',
        ),
        serverKey: seed + 'serverKey',
      );
}
