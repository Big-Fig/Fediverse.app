import '../../../mastodon_api_model.dart';

abstract class IMastodonApiPushSubscriptionAlerts
    implements IMastodonApiResponsePart {
  bool? get favourite;

  bool? get follow;

  bool? get mention;

  bool? get reblog;

  bool? get poll;
}
