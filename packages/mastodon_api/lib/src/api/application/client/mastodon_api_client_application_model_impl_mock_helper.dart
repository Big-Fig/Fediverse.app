import 'mastodon_api_client_application_model_impl.dart';

abstract class MastodonApiClientApplicationMockHelper {
  static MastodonApiClientApplication generate({
    required String seed,
  }) =>
      MastodonApiClientApplication(
        name: seed + 'name',
        website: seed + 'website',
        vapidKey: seed + 'vapidKey',
        clientSecret: seed + 'clientSecret',
        clientId: seed + 'clientId',
      );
}
