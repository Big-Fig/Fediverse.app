import 'package:mastodon_api/mastodon_api.dart';

import '../../../pleroma_api_model.dart';
import '../keys/pleroma_api_push_subscription_keys_model.dart';

abstract class IPleromaApiPushSubscriptionMetadata
    implements IMastodonApiPushSubscriptionMetadata, IPleromaApiObject {
  @override
  IPleromaApiPushSubscriptionKeys get keys;
}
