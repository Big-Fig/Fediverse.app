// ignore_for_file: no-magic-number
import 'mastodon_api_oauth_model_impl.dart';

class MastodonApiOAuthMockHelper {
  static MastodonApiOAuthToken generate({
    required String seed,
  }) =>
      MastodonApiOAuthToken(
        accessToken: seed + 'accessToken',
        tokenType: seed + 'tokenType',
        // scope: seed + 'tokenType',
        // createdAt: DateTime(seed.hashCode % 2001),
      );
}
