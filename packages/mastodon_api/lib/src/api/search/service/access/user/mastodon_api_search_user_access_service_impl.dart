import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../mastodon_api_search_model.dart';
import '../../../mastodon_api_search_model_impl.dart';
import '../../../request_type/mastodon_api_search_request_type_sealed.dart';
import 'mastodon_api_search_user_access_service.dart';

class MastodonApiSearchUserAccessService extends MastodonApiService
    implements IMastodonApiSearchUserAccessService {
  MastodonApiSearchUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  // ignore: long-parameter-list, long-method
  Future<IMastodonApiSearchResult> search({
    required String query,
    required String? accountId,
    required bool? excludeUnreviewed,
    required bool? following,
    required bool? resolve,
    required int? offset,
    required MastodonApiSearchRequestType? type,
    required IMastodonApiPagination? pagination,
  }) async =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: searchFeature,
        fieldFeatures: [
          if (excludeUnreviewed != null) searchExcludeUnreviewedFeature,
          if (accountId != null) searchPaginationAccountIdFeature,
          if (pagination != null) searchPaginationFeature,
        ],
        request: createSearchRequest(
          query: query,
          accountId: accountId,
          excludeUnreviewed: excludeUnreviewed,
          following: following,
          resolve: resolve,
          offset: offset,
          type: type,
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiSearchResult.fromJson(json),
      );

  // ignore: long-parameter-list, long-method
  RestRequest createSearchRequest({
    required String query,
    required String? accountId,
    required bool? excludeUnreviewed,
    required bool? following,
    required bool? resolve,
    required int? offset,
    required MastodonApiSearchRequestType? type,
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: '/api/v2/search',
        queryArgs: [
          UrlQueryArg(
            key: 'q',
            value: query,
          ),
          if (type != null)
            UrlQueryArg(
              key: 'type',
              value: type.stringValue,
            ),
          if (accountId != null)
            UrlQueryArg(
              key: 'account_id',
              value: accountId,
            ),
          if (excludeUnreviewed != null)
            UrlQueryArg(
              key: 'exclude_unreviewed',
              value: excludeUnreviewed.toString(),
            ),
          if (offset != null)
            UrlQueryArg(
              key: 'offset',
              value: offset.toString(),
            ),
          if (following != null)
            UrlQueryArg(
              key: 'following',
              value: following.toString(),
            ),
          if (resolve != null)
            UrlQueryArg(
              key: 'resolve',
              value: resolve.toString(),
            ),
          if (accountId != null)
            UrlQueryArg(
              key: 'account_id',
              value: accountId,
            ),
          if (pagination != null) ...pagination.toQueryArgs(),
        ],
      );

  @override
  MastodonApiFeature get searchFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.readSearch,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_0,
      );

  @override
  IMastodonApiFeature get searchExcludeUnreviewedFeature =>
      searchFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  IMastodonApiFeature get searchPaginationAccountIdFeature =>
      searchFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_8_0,
      );

  @override
  IMastodonApiFeature get searchPaginationFeature => searchFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_8_0,
      );
}
