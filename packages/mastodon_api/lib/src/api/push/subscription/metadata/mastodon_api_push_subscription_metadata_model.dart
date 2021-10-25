import '../../../mastodon_api_model.dart';
import '../keys/mastodon_api_push_subscription_keys_model.dart';

abstract class IMastodonApiPushSubscriptionMetadata
    implements IMastodonApiObject {
  /// Endpoint URL that is called when a notification event occurs.
  String get endpoint;

  IMastodonApiPushSubscriptionKeys get keys;
}
