import '../../feature/unifedi_api_feature_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../unifedi_api_service.dart';
import '../request_type/unifedi_api_search_request_type_sealed.dart';
import '../unifedi_api_search_model.dart';

abstract class IUnifediApiSearchService implements IUnifediApiService {
  IUnifediApiFeature get searchFeature;

  IUnifediApiFeature get searchPaginationFeature;

  IUnifediApiFeature get searchPaginationAccountIdFeature;

  IUnifediApiFeature get searchExcludeUnreviewedFeature;

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
  });
}
