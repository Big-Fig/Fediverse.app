import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../mastodon_api_filter_model.dart';
import '../../../post/mastodon_api_post_filter_model.dart';

abstract class IMastodonApiFilterUserAccessService extends IMastodonApiService {
  IMastodonApiFeature get getFiltersFeature;

  IMastodonApiFeature get getFilterFeature;

  IMastodonApiFeature get deleteFilterFeature;

  IMastodonApiFeature get createFilterFeature;

  IMastodonApiFeature get updateFilterFeature;

  Future<List<IMastodonApiFilter>> getFilters({
    required IMastodonApiPagination? pagination,
  });

  Future<IMastodonApiFilter> getFilter({
    required String filterId,
  });

  Future<void> deleteFilter({
    required String filterId,
  });

  Future<IMastodonApiFilter> createFilter({
    required IMastodonApiPostFilter postFilter,
  });

  Future<IMastodonApiFilter> updateFilter({
    required String filterId,
    required IMastodonApiPostFilter postFilter,
  });
}
