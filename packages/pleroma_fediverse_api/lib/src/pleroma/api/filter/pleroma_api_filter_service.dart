import 'package:pleroma_fediverse_api/src/pleroma/api/filter/pleroma_api_filter_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';

abstract class IPleromaApiFilterService extends IPleromaApi {
  Future<List<IPleromaApiFilter>> getFilters({
    IPleromaApiPaginationRequest? pagination,
  });

  Future<IPleromaApiFilter> getFilter({
    required String filterRemoteId,
  });

  Future deleteFilter({
    required String filterRemoteId,
  });

  Future<IPleromaApiFilter> createFilter({
    required IPostPleromaApiFilter postPleromaFilter,
  });

  Future<IPleromaApiFilter> updateFilter({
    required String filterRemoteId,
    required IPostPleromaApiFilter postPleromaFilter,
  });
}
