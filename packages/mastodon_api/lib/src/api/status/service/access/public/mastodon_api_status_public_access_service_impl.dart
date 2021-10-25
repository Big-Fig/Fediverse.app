import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../access/mastodon_api_access_model.dart';
import '../../../../account/mastodon_api_account_model.dart';
import '../../../../account/mastodon_api_account_model_impl.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../context/mastodon_api_status_context_model_impl.dart';
import '../../../mastodon_api_status_model.dart';
import '../../../mastodon_api_status_model_impl.dart';
import 'mastodon_api_status_public_access_service.dart';

class MastodonApiStatusPublicAccessService extends MastodonApiService
    implements IMastodonApiStatusPublicAccessService {
  final statusRelativeUrlPath = '/api/v1/statuses/';

  MastodonApiStatusPublicAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<IMastodonApiStatus> getStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getStatusFeature,
        fieldFeatures: null,
        request: createGetStatusRequest(statusId: statusId),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createGetStatusRequest({
    required String statusId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
          ],
        ),
      );

  @override
  Future<MastodonApiStatusContext> getStatusContext({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getStatusContextFeature,
        fieldFeatures: null,
        request: createGetStatusContextRequest(statusId: statusId),
        jsonParser: (json) => MastodonApiStatusContext.fromJson(json),
      );

  RestRequest createGetStatusContextRequest({
    required String statusId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'context',
          ],
        ),
      );

  @override
  Future<List<IMastodonApiAccount>> favouritedBy({
    required String statusId,
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: favouritedByFeature,
        fieldFeatures: null,
        request: createFavouritedByRequest(
          statusId: statusId,
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  RestRequest createFavouritedByRequest({
    required String statusId,
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        queryArgs: pagination?.toQueryArgs(),
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'favourited_by',
          ],
        ),
      );

  @override
  Future<List<IMastodonApiAccount>> rebloggedBy({
    required String statusId,
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: rebloggedByFeature,
        fieldFeatures: null,
        request: createRebloggedByRequest(
          statusId: statusId,
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  RestRequest createRebloggedByRequest({
    required String statusId,
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        queryArgs: pagination?.toQueryArgs(),
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'reblogged_by',
          ],
        ),
      );

  @override
  IMastodonApiFeature<IMastodonApiAccess> get getStatusContextFeature =>
      MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature<IMastodonApiAccess> get getStatusFeature =>
      MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature<IMastodonApiAccess> get favouritedByFeature =>
      MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature<IMastodonApiAccess> get rebloggedByFeature =>
      MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );
}
