import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/featured_tags/pleroma_api_featured_tags_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/tag/pleroma_api_tag_model.dart';

abstract class IPleromaApiFeaturedTagsService
    implements IMastodonApiFeaturedTagsService, IPleromaApiAuth {
  // /api/v1/featured_tags
  @override
  Future<List<IPleromaApiFeaturedTag>> getFeaturedTags({
    IMastodonApiPaginationRequest? pagination,
  });

  @override
  Future<List<IPleromaApiTag>> getSuggestedTags();

  @override
  Future<IPleromaApiFeaturedTag> featureTag({
    required String name,
  });
}
