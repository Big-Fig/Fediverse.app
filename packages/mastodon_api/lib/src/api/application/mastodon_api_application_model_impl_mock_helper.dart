import 'mastodon_api_application_model_impl.dart';

abstract class MastodonApiApplicationMockHelper {
  static MastodonApiApplication generate({
    required String seed,
  }) =>
      MastodonApiApplication(
        name: seed + 'name',
        website: seed + 'website',
        vapidKey: seed + 'vapidKey',
      );
}
