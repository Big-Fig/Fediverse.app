import '../../../mastodon_api_model.dart';

abstract class IMastodonApiInstanceActivityItem
    implements IMastodonApiResponse {
  int get week;

  int get statuses;

  int get logins;

  int get registrations;
}
