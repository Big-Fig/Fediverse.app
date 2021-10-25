import '../account/mastodon_api_account_model.dart';
import '../mastodon_api_model.dart';
import '../status/mastodon_api_status_model.dart';

abstract class IMastodonApiConversation implements IMastodonApiResponse {
  bool? get unread;

  IMastodonApiStatus? get lastStatus;

  String get id;

  List<IMastodonApiAccount> get accounts;
}
