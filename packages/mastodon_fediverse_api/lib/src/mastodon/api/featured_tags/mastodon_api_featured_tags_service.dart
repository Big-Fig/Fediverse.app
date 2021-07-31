import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/featured_tags/mastodon_api_featured_tags_model.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/pagination/mastodon_api_pagination_model.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/tag/mastodon_api_tag_model.dart';

abstract class IMastodonApiFeaturedTagsService implements IDisposable {
  // /api/v1/endorsements
  Future<List<IMastodonApiFeaturedTag>> getFeaturedTags({
    IMastodonApiPaginationRequest? pagination,
  });

  Future<List<IMastodonApiTag>> getSuggestedTags();

  Future<IMastodonApiFeaturedTag> featureTag({
    required String name,
  });

  Future unFeatureTag({
    required String id,
  });
}
