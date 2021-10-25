// ignore_for_file: no-magic-number
import '../keys/unifedi_api_push_subscription_keys_model_impl_mock_helper.dart';
import 'unifedi_api_push_subscription_metadata_model_impl.dart';

// ignore_for_file: no-equal-arguments

class UnifediApiPushSubscriptionMetadataMockHelper {
  static UnifediApiPushSubscriptionMetadata generate({
    required String seed,
  }) =>
      UnifediApiPushSubscriptionMetadata(
        endpoint: seed + 'endpoint',
        keys: UnifediApiPushSubscriptionKeysMockHelper.generate(
          seed: seed,
        ),
      );
}
