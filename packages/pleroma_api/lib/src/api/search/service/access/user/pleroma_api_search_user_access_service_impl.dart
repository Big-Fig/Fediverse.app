import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../pleroma_api_search_model.dart';
import '../../../pleroma_api_search_model_impl.dart';
import '../../../request_type/pleroma_api_search_request_type_sealed.dart';
import 'pleroma_api_search_user_access_service.dart';

class PleromaApiSearchUserAccessService extends PleromaApiService
    implements IPleromaApiSearchUserAccessService {
  final MastodonApiSearchUserAccessService mastodonApiSearchUserAccessService;

  PleromaApiSearchUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiSearchUserAccessService = MastodonApiSearchUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiSearchUserAccessService.disposeWith(this);
  }

  @override
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
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: searchFeature,
        fieldFeatures: [
          if (excludeUnreviewed != null) searchExcludeUnreviewedFeature,
          if (accountId != null) searchPaginationAccountIdFeature,
          if (pagination != null) searchPaginationFeature,
        ],
        request: mastodonApiSearchUserAccessService.createSearchRequest(
          query: query,
          accountId: accountId,
          excludeUnreviewed: excludeUnreviewed,
          following: following,
          resolve: resolve,
          offset: offset,
          type: type?.toMastodonApiSearchRequestType(),
          pagination: pagination,
        ),
        jsonParser: (json) => PleromaApiSearchResult.fromJson(json),
      );

  @override
  IPleromaApiFeature get searchExcludeUnreviewedFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiSearchUserAccessService.searchExcludeUnreviewedFeature,
      );

  @override
  IPleromaApiFeature get searchFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiSearchUserAccessService.searchFeature,
      );

  @override
  IPleromaApiFeature get searchPaginationAccountIdFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiSearchUserAccessService.searchPaginationAccountIdFeature,
      );

  @override
  IPleromaApiFeature get searchPaginationFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiSearchUserAccessService.searchPaginationFeature,
      );
}
