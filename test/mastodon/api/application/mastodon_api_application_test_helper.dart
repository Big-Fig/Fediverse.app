import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';

class MastodonApiApplicationTestHelper {
  static MastodonApiApplicationRegistrationRequest
      createTestMastodonApiApplicationRegistrationRequest({
    required String seed,
  }) =>
          MastodonApiApplicationRegistrationRequest(
            clientName: seed + 'clientName',
            redirectUris: seed + 'redirectUris',
            scopes: seed + 'scopes',
            website: seed + 'website',
          );
}
