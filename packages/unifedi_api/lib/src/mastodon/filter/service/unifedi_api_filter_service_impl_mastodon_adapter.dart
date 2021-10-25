import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/filter/post/unifedi_api_post_filter_model.dart';
import '../../../api/filter/service/unifedi_api_filter_service.dart';
import '../../../api/filter/unifedi_api_filter_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../unifedi_api_filter_model_mastodon_adapter.dart';

class UnifediApiFilterServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiFilterService {
  final IMastodonApiFilterUserAccessService mastodonApiFilterUserAccessService;

  UnifediApiFilterServiceMastodonAdapter({
    required this.mastodonApiFilterUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService: mastodonApiFilterUserAccessService.restService,
      );

  @override
  Future<IUnifediApiFilter> createFilter({
    required IUnifediApiPostFilter postFilter,
  }) =>
      mastodonApiFilterUserAccessService
          .createFilter(
            postFilter: MastodonApiPostFilter(
              context: postFilter.context,
              expiresIn: postFilter.expiresIn,
              irreversible: postFilter.irreversible,
              phrase: postFilter.phrase,
              wholeWord: postFilter.wholeWord,
            ),
          )
          .then(
            (value) => value.toUnifediApiFilterMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get createFilterFeature =>
      mastodonApiFilterUserAccessService.createFilterFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> deleteFilter({
    required String filterId,
  }) =>
      mastodonApiFilterUserAccessService.deleteFilter(
        filterId: filterId,
      );

  @override
  IUnifediApiFeature get deleteFilterFeature =>
      mastodonApiFilterUserAccessService.deleteFilterFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiFilter> getFilter({
    required String filterId,
  }) =>
      mastodonApiFilterUserAccessService
          .getFilter(
            filterId: filterId,
          )
          .then(
            (value) => value.toUnifediApiFilterMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get getFilterFeature =>
      mastodonApiFilterUserAccessService.getFilterFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiFilter>> getFilters({
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiFilterUserAccessService
          .getFilters(
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiFilterMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getFiltersFeature =>
      mastodonApiFilterUserAccessService.getFiltersFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiFilter> updateFilter({
    required String filterId,
    required IUnifediApiPostFilter postFilter,
  }) =>
      mastodonApiFilterUserAccessService
          .updateFilter(
            filterId: filterId,
            postFilter: MastodonApiPostFilter(
              context: postFilter.context,
              expiresIn: postFilter.expiresIn,
              irreversible: postFilter.irreversible,
              phrase: postFilter.phrase,
              wholeWord: postFilter.wholeWord,
            ),
          )
          .then(
            (value) => value.toUnifediApiFilterMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get updateFilterFeature =>
      mastodonApiFilterUserAccessService.updateFilterFeature
          .toUnifediApiFeatureMastodonAdapter();
}
