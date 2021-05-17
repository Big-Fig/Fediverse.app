import 'package:fedi/mastodon/api/trends/mastodon_api_trends_service.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';

abstract class IPleromaApiTrendsService implements IMastodonApiTrendsService {
  // /api/v1/trends
  @override
  Future<List<IPleromaApiTag>> getTrendingTags({
    // ignore: no-magic-number
    int limit = 10,
  });
}
