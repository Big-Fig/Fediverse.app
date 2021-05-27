import 'package:fedi/mastodon/api/featured_tags/mastodon_api_featured_tags_service.dart';
import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiFeaturedTagsService
    implements IMastodonApiFeaturedTagsService, IPleromaApiAuth {
  static IPleromaApiFeaturedTagsService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiFeaturedTagsService>(
        context,
        listen: listen,
      );

  // /api/v1/featured_tags
  @override
  Future<List<IPleromaFeaturedTag>> getFeaturedTags({
    IMastodonApiPaginationRequest? pagination,
  });

  @override
  Future<List<IPleromaFeaturedTag>> getSuggestedTags();

  @override
  Future<IPleromaFeaturedTag> featureTag({
    required String name,
  });
}
