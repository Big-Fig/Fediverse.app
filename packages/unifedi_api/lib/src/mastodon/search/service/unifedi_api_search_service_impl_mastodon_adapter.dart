import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/search/request_type/unifedi_api_search_request_type_sealed.dart';
import '../../../api/search/service/unifedi_api_search_service.dart';
import '../../../api/search/unifedi_api_search_model.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../unifedi_api_search_model_mastodon_adapter.dart';

class UnifediApiSearchServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiSearchService {
  final IMastodonApiSearchUserAccessService mastodonApiSearchUserAccessService;

  UnifediApiSearchServiceMastodonAdapter({
    required this.mastodonApiSearchUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService: mastodonApiSearchUserAccessService.restService,
      );

  @override
  // ignore: long-parameter-list
  Future<IUnifediApiSearchResult> search({
    required String query,
    required String? accountId,
    required UnifediApiSearchRequestType? type,
    required bool? excludeUnreviewed,
    required bool? following,
    required bool? resolve,
    required int? offset,
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiSearchUserAccessService
          .search(
            query: query,
            accountId: accountId,
            type: type?.toMastodonApiSearchRequestType(),
            excludeUnreviewed: excludeUnreviewed,
            following: following,
            resolve: resolve,
            offset: offset,
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiSearchResultMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get searchExcludeUnreviewedFeature =>
      mastodonApiSearchUserAccessService.searchExcludeUnreviewedFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get searchFeature =>
      mastodonApiSearchUserAccessService.searchFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get searchPaginationAccountIdFeature =>
      mastodonApiSearchUserAccessService.searchPaginationAccountIdFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get searchPaginationFeature =>
      mastodonApiSearchUserAccessService.searchPaginationFeature
          .toUnifediApiFeatureMastodonAdapter();
}
