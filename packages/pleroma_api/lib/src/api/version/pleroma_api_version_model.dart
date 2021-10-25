import 'package:mastodon_api/mastodon_api.dart';

abstract class IPleromaApiVersion implements IMastodonApiVersion {
  IMastodonApiVersion get mastodonCompatibilityVersion;
}
