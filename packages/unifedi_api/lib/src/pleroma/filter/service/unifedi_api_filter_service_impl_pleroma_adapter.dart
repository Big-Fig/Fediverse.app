import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/filter/post/unifedi_api_post_filter_model.dart';
import '../../../api/filter/service/unifedi_api_filter_service.dart';
import '../../../api/filter/unifedi_api_filter_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../unifedi_api_filter_model_pleroma_adapter.dart';

class UnifediApiFilterServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiFilterService {
  final IPleromaApiFilterUserAccessService pleromaApiFilterUserAccessService;

  UnifediApiFilterServicePleromaAdapter({
    required this.pleromaApiFilterUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiFilterUserAccessService.restService,
      );

  @override
  Future<IUnifediApiFilter> createFilter({
    required IUnifediApiPostFilter postFilter,
  }) =>
      pleromaApiFilterUserAccessService
          .createFilter(
            postFilter: PleromaApiPostFilter(
              context: postFilter.context,
              expiresIn: postFilter.expiresIn,
              irreversible: postFilter.irreversible,
              phrase: postFilter.phrase,
              wholeWord: postFilter.wholeWord,
            ),
          )
          .then(
            (value) => value.toUnifediApiFilterPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get createFilterFeature =>
      pleromaApiFilterUserAccessService.createFilterFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> deleteFilter({
    required String filterId,
  }) =>
      pleromaApiFilterUserAccessService.deleteFilter(
        filterId: filterId,
      );

  @override
  IUnifediApiFeature get deleteFilterFeature =>
      pleromaApiFilterUserAccessService.deleteFilterFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiFilter> getFilter({
    required String filterId,
  }) =>
      pleromaApiFilterUserAccessService
          .getFilter(
            filterId: filterId,
          )
          .then(
            (value) => value.toUnifediApiFilterPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getFilterFeature =>
      pleromaApiFilterUserAccessService.getFilterFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiFilter>> getFilters({
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiFilterUserAccessService
          .getFilters(
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiFilterPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getFiltersFeature =>
      pleromaApiFilterUserAccessService.getFiltersFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiFilter> updateFilter({
    required String filterId,
    required IUnifediApiPostFilter postFilter,
  }) =>
      pleromaApiFilterUserAccessService
          .updateFilter(
            filterId: filterId,
            postFilter: PleromaApiPostFilter(
              context: postFilter.context,
              expiresIn: postFilter.expiresIn,
              irreversible: postFilter.irreversible,
              phrase: postFilter.phrase,
              wholeWord: postFilter.wholeWord,
            ),
          )
          .then(
            (value) => value.toUnifediApiFilterPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get updateFilterFeature =>
      pleromaApiFilterUserAccessService.updateFilterFeature
          .toUnifediApiFeaturePleromaAdapter();
}
