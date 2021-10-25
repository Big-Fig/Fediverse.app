// ignore_for_file: no-magic-number
import '../keys/pleroma_api_push_subscription_keys_model_impl_mock_helper.dart';
import 'pleroma_api_push_subscription_metadata_model_impl.dart';

// ignore_for_file: no-equal-arguments

class PleromaApiPushSubscriptionMetadataMockHelper {
  static PleromaApiPushSubscriptionMetadata generate({
    required String seed,
  }) =>
      PleromaApiPushSubscriptionMetadata(
        endpoint: seed + 'endpoint',
        keys: PleromaApiPushSubscriptionKeysMockHelper.generate(
          seed: seed,
        ),
      );
}
