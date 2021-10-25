import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../mastodon_api_filter_model.dart';
import '../../../mastodon_api_filter_model_impl.dart';
import '../../../post/mastodon_api_post_filter_model.dart';
import 'mastodon_api_filter_user_access_service.dart';

class MastodonApiFilterUserAccessService extends MastodonApiService
    implements IMastodonApiFilterUserAccessService {
  static const filterRelativeUrlPath = '/api/v1/filters';

  MastodonApiFilterUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<List<IMastodonApiFilter>> getFilters({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getFiltersFeature,
        fieldFeatures: null,
        request: createGetFiltersRequest(
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiFilter.fromJson(json),
      );

  RestRequest createGetFiltersRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            filterRelativeUrlPath,
          ],
        ),
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
        ],
      );

  @override
  Future<IMastodonApiFilter> getFilter({
    required String filterId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getFilterFeature,
        fieldFeatures: null,
        request: createGetFilterRequest(
          filterId: filterId,
        ),
        jsonParser: (json) => MastodonApiFilter.fromJson(json),
      );

  RestRequest createGetFilterRequest({
    required String filterId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            filterRelativeUrlPath,
            filterId,
          ],
        ),
      );

  @override
  Future<void> deleteFilter({
    required String filterId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: deleteFilterFeature,
        fieldFeatures: null,
        request: createDeleteFilterRequest(filterId: filterId),
        jsonParser: (json) => MastodonApiFilter.fromJson(json),
      );

  RestRequest createDeleteFilterRequest({
    required String filterId,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join(
          [
            filterRelativeUrlPath,
            filterId,
          ],
        ),
      );

  @override
  Future<IMastodonApiFilter> createFilter({
    required IMastodonApiPostFilter postFilter,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: createFilterFeature,
        fieldFeatures: null,
        request: createCreateFilterRequest(
          postFilter: postFilter,
        ),
        jsonParser: (json) => MastodonApiFilter.fromJson(json),
      );

  RestRequest createCreateFilterRequest({
    required IMastodonApiPostFilter postFilter,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            filterRelativeUrlPath,
          ],
        ),
        bodyJson: createFilterRequestBodyJson(
          postFilter: postFilter,
        ),
      );

  Map<String, dynamic> createFilterRequestBodyJson({
    required IMastodonApiPostFilter postFilter,
  }) {
    var expiresIn = postFilter.expiresIn;

    return <String, dynamic>{
      'phrase': postFilter.phrase,
      'context': postFilter.context,
      'irreversible': postFilter.irreversible,
      'whole_word': postFilter.wholeWord,
      if (expiresIn != null)
        'expires_in':
            expiresIn.inMilliseconds ~/ Duration.millisecondsPerSecond,
    };
  }

  @override
  Future<IMastodonApiFilter> updateFilter({
    required String filterId,
    required IMastodonApiPostFilter postFilter,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: updateFilterFeature,
        fieldFeatures: null,
        request: createUpdateFilterRequest(
          filterId: filterId,
          postFilter: postFilter,
        ),
        jsonParser: (json) => MastodonApiFilter.fromJson(json),
      );

  RestRequest createUpdateFilterRequest({
    required String filterId,
    required IMastodonApiPostFilter postFilter,
  }) =>
      RestRequest.put(
        relativePath: UrlPathHelper.join(
          [
            filterRelativeUrlPath,
            filterId,
          ],
        ),
        bodyJson: createFilterRequestBodyJson(
          postFilter: postFilter,
        ),
      );

  @override
  IMastodonApiFeature get createFilterFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFilters,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_3,
      );

  @override
  IMastodonApiFeature get deleteFilterFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFilters,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_3,
      );

  @override
  IMastodonApiFeature get getFilterFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.readFilters,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_3,
      );

  @override
  IMastodonApiFeature get getFiltersFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.readFilters,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_3,
      );

  @override
  IMastodonApiFeature get updateFilterFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFilters,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_4_3,
      );
}
