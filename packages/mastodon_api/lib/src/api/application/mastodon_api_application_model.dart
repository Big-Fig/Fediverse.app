import '../mastodon_api_model.dart';

abstract class IMastodonApiApplication implements IMastodonApiResponse {
  String? get name;

  String? get website;

  String? get vapidKey;
}
