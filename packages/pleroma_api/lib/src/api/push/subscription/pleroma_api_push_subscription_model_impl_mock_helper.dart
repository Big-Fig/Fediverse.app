// ignore_for_file: no-magic-number
import 'alerts/pleroma_api_push_subscription_alerts_model_impl_mock_helper.dart';
import 'pleroma_api_push_subscription_model_impl.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiPushSubscriptionMockHelper {
  static PleromaApiPushSubscription generate({
    required String seed,
  }) =>
      PleromaApiPushSubscription(
        id: seed + 'id',
        endpoint: seed + 'endpoint',
        alerts: PleromaApiPushSubscriptionAlertsMockHelper.generate(
          seed: seed + 'alerts',
        ),
        serverKey: seed + 'serverKey',
      );
}
