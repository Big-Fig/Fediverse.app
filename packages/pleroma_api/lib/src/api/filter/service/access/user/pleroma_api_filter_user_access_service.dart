import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../pleroma_api_filter_model.dart';
import '../../../post/pleroma_api_post_filter_model.dart';

abstract class IPleromaApiFilterUserAccessService extends IPleromaApiService {
  IPleromaApiFeature get getFiltersFeature;

  IPleromaApiFeature get getFilterFeature;

  IPleromaApiFeature get deleteFilterFeature;

  IPleromaApiFeature get createFilterFeature;

  IPleromaApiFeature get updateFilterFeature;

  Future<List<IPleromaApiFilter>> getFilters({
    required IPleromaApiPagination? pagination,
  });

  Future<IPleromaApiFilter> getFilter({
    required String filterId,
  });

  Future<void> deleteFilter({
    required String filterId,
  });

  Future<IPleromaApiFilter> createFilter({
    required IPleromaApiPostFilter postFilter,
  });

  Future<IPleromaApiFilter> updateFilter({
    required String filterId,
    required IPleromaApiPostFilter postFilter,
  });
}
