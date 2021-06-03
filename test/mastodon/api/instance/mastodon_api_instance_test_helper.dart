// ignore_for_file: no-magic-number
import 'package:fedi/mastodon/api/instance/mastodon_api_instance_model.dart';

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
