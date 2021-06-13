import 'package:fedi/mastodon/api/trends/mastodon_api_trends_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiTrendsService
    implements IMastodonApiTrendsService, IPleromaApi {
  static IPleromaApiTrendsService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiTrendsService>(
        context,
        listen: listen,
      );

  // /api/v1/trends
  @override
  Future<List<IPleromaApiTag>> getTrendingTags({
    // ignore: no-magic-number
    int? limit = 10,
  });
}
