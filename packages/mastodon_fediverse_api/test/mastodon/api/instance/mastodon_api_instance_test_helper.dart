// ignore_for_file: no-magic-number
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';

class MastodonApiInstanceTestHelper {
  static MastodonApiUrls createTestMastodonApiUrls({
    required String seed,
  }) {
    return MastodonApiUrls(
      streamingApi: seed + 'streamingApi',
    );
  }

  static MastodonApiInstanceStats createTestMastodonApiInstanceStats({
    required String seed,
  }) =>
      MastodonApiInstanceStats(
        userCount: seed.hashCode + 1,
        statusCount: seed.hashCode + 2,
        domainCount: seed.hashCode + 3,
      );
}
