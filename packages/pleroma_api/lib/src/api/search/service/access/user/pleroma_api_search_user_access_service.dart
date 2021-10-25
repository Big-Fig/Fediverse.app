import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../pleroma_api_search_model.dart';
import '../../../request_type/pleroma_api_search_request_type_sealed.dart';

abstract class IPleromaApiSearchUserAccessService
    implements IPleromaApiService {
  IPleromaApiFeature get searchFeature;

  IPleromaApiFeature get searchPaginationFeature;

  IPleromaApiFeature get searchPaginationAccountIdFeature;

  IPleromaApiFeature get searchExcludeUnreviewedFeature;

  // ignore: long-parameter-list
  Future<IPleromaApiSearchResult> search({
    required String query,
    required String? accountId,
    required PleromaApiSearchRequestType? type,
    required bool? excludeUnreviewed,
    required bool? following,
    required bool? resolve,
    required int? offset,
    required IPleromaApiPagination? pagination,
  });
}
