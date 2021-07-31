import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/tag/pleroma_api_tag_model.dart';

abstract class IPleromaApiTrendsService
    implements IMastodonApiTrendsService, IPleromaApi {
  // /api/v1/trends
  @override
  Future<List<IPleromaApiTag>> getTrendingTags({
    // ignore: no-magic-number
    int? limit = 10,
  });
}
