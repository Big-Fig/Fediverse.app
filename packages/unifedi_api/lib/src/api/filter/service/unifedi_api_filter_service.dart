import '../../feature/unifedi_api_feature_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../unifedi_api_service.dart';
import '../post/unifedi_api_post_filter_model.dart';
import '../unifedi_api_filter_model.dart';

abstract class IUnifediApiFilterService extends IUnifediApiService {
  IUnifediApiFeature get getFiltersFeature;

  IUnifediApiFeature get getFilterFeature;

  IUnifediApiFeature get deleteFilterFeature;

  IUnifediApiFeature get createFilterFeature;

  IUnifediApiFeature get updateFilterFeature;

  Future<List<IUnifediApiFilter>> getFilters({
    required IUnifediApiPagination? pagination,
  });

  Future<IUnifediApiFilter> getFilter({
    required String filterId,
  });

  Future<void> deleteFilter({
    required String filterId,
  });

  Future<IUnifediApiFilter> createFilter({
    required IUnifediApiPostFilter postFilter,
  });

  Future<IUnifediApiFilter> updateFilter({
    required String filterId,
    required IUnifediApiPostFilter postFilter,
  });
}
