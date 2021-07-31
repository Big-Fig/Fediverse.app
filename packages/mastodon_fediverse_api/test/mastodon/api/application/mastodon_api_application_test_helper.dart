import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';

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
