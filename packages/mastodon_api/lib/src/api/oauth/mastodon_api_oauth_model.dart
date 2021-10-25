import '../mastodon_api_model.dart';

abstract class IMastodonApiOAuthToken implements IMastodonApiResponse {
  String get accessToken;

  String get tokenType;
}
