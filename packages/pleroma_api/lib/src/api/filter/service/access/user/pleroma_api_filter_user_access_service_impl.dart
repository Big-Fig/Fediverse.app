import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../pleroma_api_filter_model.dart';
import '../../../pleroma_api_filter_model_impl.dart';
import '../../../post/pleroma_api_post_filter_model.dart';
import 'pleroma_api_filter_user_access_service.dart';

class PleromaApiFilterUserAccessService extends PleromaApiService
    implements IPleromaApiFilterUserAccessService {
  final MastodonApiFilterUserAccessService mastodonApiFilterUserAccessService;

  PleromaApiFilterUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiFilterUserAccessService = MastodonApiFilterUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiFilterUserAccessService.disposeWith(this);
  }

  @override
  Future<List<IPleromaApiFilter>> getFilters({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getFiltersFeature,
        fieldFeatures: null,
        request: mastodonApiFilterUserAccessService.createGetFiltersRequest(
          pagination: pagination,
        ),
        jsonParser: (json) => PleromaApiFilter.fromJson(json),
      );

  @override
  Future<IPleromaApiFilter> getFilter({
    required String filterId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getFilterFeature,
        fieldFeatures: null,
        request: mastodonApiFilterUserAccessService.createGetFilterRequest(
          filterId: filterId,
        ),
        jsonParser: (json) => PleromaApiFilter.fromJson(json),
      );

  @override
  Future<void> deleteFilter({
    required String filterId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: deleteFilterFeature,
        fieldFeatures: null,
        request: mastodonApiFilterUserAccessService.createDeleteFilterRequest(
          filterId: filterId,
        ),
        jsonParser: (json) => PleromaApiFilter.fromJson(json),
      );

  @override
  Future<IPleromaApiFilter> createFilter({
    required IPleromaApiPostFilter postFilter,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: createFilterFeature,
        fieldFeatures: null,
        request: mastodonApiFilterUserAccessService.createCreateFilterRequest(
          postFilter: postFilter,
        ),
        jsonParser: (json) => PleromaApiFilter.fromJson(json),
      );

  @override
  Future<IPleromaApiFilter> updateFilter({
    required String filterId,
    required IPleromaApiPostFilter postFilter,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: createFilterFeature,
        fieldFeatures: null,
        request: mastodonApiFilterUserAccessService.createUpdateFilterRequest(
          filterId: filterId,
          postFilter: postFilter,
        ),
        jsonParser: (json) => PleromaApiFilter.fromJson(json),
      );

  @override
  IPleromaApiFeature get createFilterFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiFilterUserAccessService.createFilterFeature,
      );

  @override
  IPleromaApiFeature get deleteFilterFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiFilterUserAccessService.deleteFilterFeature,
      );

  @override
  IPleromaApiFeature get getFilterFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiFilterUserAccessService.getFilterFeature,
      );

  @override
  IPleromaApiFeature get getFiltersFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiFilterUserAccessService.getFiltersFeature,
      );

  @override
  IPleromaApiFeature get updateFilterFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiFilterUserAccessService.updateFilterFeature,
      );
}
