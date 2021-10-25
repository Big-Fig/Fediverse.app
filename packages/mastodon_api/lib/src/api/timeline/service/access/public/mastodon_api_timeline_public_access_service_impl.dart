import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../../status/mastodon_api_status_model.dart';
import '../../../../status/mastodon_api_status_model_impl.dart';
import 'mastodon_api_timeline_public_access_service.dart';

class MastodonApiTimelinePublicAccessService extends MastodonApiService
    implements IMastodonApiTimelinePublicAccessService {
  static const timelineRelativeUrlPath = '/api/v1/timelines/';

  MastodonApiTimelinePublicAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<List<IMastodonApiStatus>> getHashtagTimeline({
    required String hashtag,
    required IMastodonApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
  }) =>
      getTimeline(
        relativeTimeLineUrlPath: 'tag/$hashtag',
        pagination: pagination,
        onlyWithMedia: onlyWithMedia,
        onlyLocal: onlyLocal,
        onlyRemote: null,
        requestFeature: getHashtagTimelineFeature,
        fieldFeatures: [
          if (onlyWithMedia != null) getHashtagTimelineOnlyMediaFeature,
          if (pagination?.minId != null)
            getHashtagTimelinePaginationMinIdFeature,
        ],
      );

  @override
  // ignore: long-parameter-list
  Future<List<IMastodonApiStatus>> getPublicTimeline({
    required IMastodonApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? onlyRemote,
  }) =>
      getTimeline(
        relativeTimeLineUrlPath: 'public',
        pagination: pagination,
        onlyWithMedia: onlyWithMedia,
        onlyLocal: onlyLocal,
        onlyRemote: onlyRemote,
        requestFeature: getPublicTimelineFeature,
        fieldFeatures: [
          if (onlyWithMedia != null) getPublicTimelineOnlyMediaFeature,
          if (onlyRemote != null) getPublicTimelineOnlyRemoteFeature,
          if (pagination?.minId != null)
            getPublicTimelinePaginationMinIdFeature,
        ],
      );

  // ignore: long-parameter-list
  Future<List<IMastodonApiStatus>> getTimeline({
    required String relativeTimeLineUrlPath,
    required IMastodonApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? onlyRemote,
    required IMastodonApiFeature requestFeature,
    required List<IMastodonApiFeature>? fieldFeatures,
  }) =>
      sendAndProcessMastodonApiStatusResponse(
        request: createGetTimelineRequest(
          relativeTimeLineUrlPath: relativeTimeLineUrlPath,
          pagination: pagination,
          onlyWithMedia: onlyWithMedia,
          onlyLocal: onlyLocal,
          onlyRemote: onlyRemote,
        ),
        requestFeature: requestFeature,
        fieldFeatures: fieldFeatures,
      );

  RestRequest createGetTimelineRequest({
    required String relativeTimeLineUrlPath,
    required IMastodonApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? onlyRemote,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            timelineRelativeUrlPath,
            relativeTimeLineUrlPath,
          ],
        ),
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
          if (onlyLocal != null)
            UrlQueryArg(
              key: 'local',
              value: onlyLocal.toString(),
            ),
          if (onlyRemote != null)
            UrlQueryArg(
              key: 'remote',
              value: onlyRemote.toString(),
            ),
          if (onlyWithMedia != null)
            UrlQueryArg(
              key: 'only_media',
              value: onlyWithMedia.toString(),
            ),
        ],
      );

  Future<List<IMastodonApiStatus>> sendAndProcessMastodonApiStatusResponse({
    required RestRequest request,
    required IMastodonApiFeature requestFeature,
    required List<IMastodonApiFeature>? fieldFeatures,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        request: request,
        requestFeature: requestFeature,
        fieldFeatures: fieldFeatures,
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  @override
  MastodonApiFeature get getHashtagTimelineFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get getHashtagTimelineOnlyMediaFeature =>
      getHashtagTimelineFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_3_0,
      );

  @override
  IMastodonApiFeature get getHashtagTimelinePaginationMinIdFeature =>
      getHashtagTimelineFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
      );

  @override
  MastodonApiFeature get getPublicTimelineFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.publicRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get getPublicTimelineOnlyMediaFeature =>
      getPublicTimelineFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_3_0,
      );

  @override
  IMastodonApiFeature get getPublicTimelineOnlyRemoteFeature =>
      getPublicTimelineFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_4,
      );

  @override
  IMastodonApiFeature get getPublicTimelinePaginationMinIdFeature =>
      getPublicTimelineFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
      );
}
