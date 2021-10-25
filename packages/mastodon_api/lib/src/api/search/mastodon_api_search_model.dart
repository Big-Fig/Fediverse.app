import '../account/mastodon_api_account_model.dart';
import '../mastodon_api_model.dart';
import '../status/mastodon_api_status_model.dart';
import '../tag/mastodon_api_tag_model.dart';

abstract class IMastodonApiSearchResult implements IMastodonApiResponse {
  List<IMastodonApiAccount> get accounts;

  List<IMastodonApiStatus> get statuses;

  List<IMastodonApiTag> get hashtags;
}
