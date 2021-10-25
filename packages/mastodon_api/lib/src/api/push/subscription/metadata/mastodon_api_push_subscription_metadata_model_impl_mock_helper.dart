// ignore_for_file: no-magic-number
import '../keys/mastodon_api_push_subscription_keys_model_impl_mock_helper.dart';
import 'mastodon_api_push_subscription_metadata_model_impl.dart';

// ignore_for_file: no-equal-arguments

class MastodonApiPushSubscriptionMetadataMockHelper {
  static MastodonApiPushSubscriptionMetadata generate({
    required String seed,
  }) =>
      MastodonApiPushSubscriptionMetadata(
        endpoint: seed + 'endpoint',
        keys: MastodonApiPushSubscriptionKeysMockHelper.generate(
          seed: seed,
        ),
      );
}
