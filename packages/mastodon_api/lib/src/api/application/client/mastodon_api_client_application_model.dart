import '../mastodon_api_application_model.dart';

abstract class IMastodonApiClientApplication extends IMastodonApiApplication {
  String get clientId;

  String get clientSecret;
}
