import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/api/featured_tags/mastodon_api_featured_tags_model.dart';
import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';

abstract class IMastodonApiFeaturedTagsService implements IDisposable {
  // /api/v1/endorsements
  Future<List<IMastodonFeaturedTag>> getFeaturedTags({
    IMastodonApiPaginationRequest? pagination,
  });

  Future<List<IMastodonFeaturedTag>> getSuggestedTags();

  Future<IMastodonFeaturedTag> featureTag({
    required String name,
  });

  Future unFeatureTag({
    required String id,
  });
}
