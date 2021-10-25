import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../mastodon_api_search_model.dart';
import '../../../request_type/mastodon_api_search_request_type_sealed.dart';

abstract class IMastodonApiSearchUserAccessService
    implements IMastodonApiService {
  IMastodonApiFeature get searchFeature;

  IMastodonApiFeature get searchPaginationFeature;

  IMastodonApiFeature get searchPaginationAccountIdFeature;

  IMastodonApiFeature get searchExcludeUnreviewedFeature;

  // ignore: long-parameter-list
  Future<IMastodonApiSearchResult> search({
    required String query,
    required String? accountId,
    required MastodonApiSearchRequestType? type,
    required bool? excludeUnreviewed,
    required bool? following,
    required bool? resolve,
    required int? offset,
    required IMastodonApiPagination? pagination,
  });
}
