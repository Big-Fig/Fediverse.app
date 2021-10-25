import 'package:mastodon_api/mastodon_api.dart';

import '../../../pleroma_api_model.dart';

abstract class IPleromaApiPushSubscriptionAlerts
    implements IMastodonApiPushSubscriptionAlerts, IPleromaApiResponsePart {
  bool? get pleromaChatMention;

  bool? get pleromaEmojiReaction;
}
