import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/tag/mastodon_api_tag_model.dart';

abstract class IMastodonApiTrendsService implements IDisposable {
  // /api/v1/trends
  Future<List<IMastodonApiTag>> getTrendingTags({
    // ignore: no-magic-number
    int limit = 10,
  });
}
