import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/search/request_type/unifedi_api_search_request_type_sealed.dart';
import '../../../api/search/service/unifedi_api_search_service.dart';
import '../../../api/search/unifedi_api_search_model.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../request_type/unifedi_api_search_request_type_sealed_pleroma_converter.dart';
import '../unifedi_api_search_model_pleroma_adapter.dart';

class UnifediApiSearchServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiSearchService {
  final IPleromaApiSearchUserAccessService pleromaApiSearchUserAccessService;

  UnifediApiSearchServicePleromaAdapter({
    required this.pleromaApiSearchUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiSearchUserAccessService.restService,
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
      pleromaApiSearchUserAccessService
          .search(
            query: query,
            accountId: accountId,
            type: type?.toPleromaApiSearchRequestType(),
            excludeUnreviewed: excludeUnreviewed,
            following: following,
            resolve: resolve,
            offset: offset,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiSearchResultPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get searchExcludeUnreviewedFeature =>
      pleromaApiSearchUserAccessService.searchExcludeUnreviewedFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get searchFeature =>
      pleromaApiSearchUserAccessService.searchFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get searchPaginationAccountIdFeature =>
      pleromaApiSearchUserAccessService.searchPaginationAccountIdFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get searchPaginationFeature =>
      pleromaApiSearchUserAccessService.searchPaginationFeature
          .toUnifediApiFeaturePleromaAdapter();
}
