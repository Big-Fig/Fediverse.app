import 'package:mastodon_fediverse_api/src/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/status/mastodon_api_status_model.dart';

abstract class IMastodonApiConversation {
  bool? get unread;

  IMastodonApiStatus? get lastStatus;

  String get id;

  List<IMastodonApiAccount> get accounts;
}
