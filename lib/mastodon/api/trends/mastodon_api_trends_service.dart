import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/api/tag/mastodon_api_tag_model.dart';

abstract class IMastodonApiTrendsService implements IDisposable {
  // /api/v1/trends
  Future<List<IMastodonApiTag>> getTrendingTags({
    // ignore: no-magic-number
    int limit = 10,
  });
}
