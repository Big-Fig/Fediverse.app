import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../status/mastodon_api_status_model.dart';
import '../public/mastodon_api_timeline_public_access_service_impl.dart';
import 'mastodon_api_timeline_user_access_service.dart';

class MastodonApiTimelineUserAccessService
    extends MastodonApiTimelinePublicAccessService
    implements IMastodonApiTimelineUserAccessService {
  MastodonApiTimelineUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<List<IMastodonApiStatus>> getListTimeline({
    required String listId,
    required IMastodonApiPagination? pagination,
  }) =>
      getTimeline(
        relativeTimeLineUrlPath: 'list/$listId',
        pagination: pagination,
        onlyWithMedia: null,
        onlyLocal: null,
        onlyRemote: null,
        requestFeature: getListTimelineFeature,
        fieldFeatures: [
          if (pagination?.minId != null) getListTimelinePaginationMinIdFeature,
        ],
      );

  @override
  Future<List<IMastodonApiStatus>> getHomeTimeline({
    required IMastodonApiPagination? pagination,
    required bool? onlyLocal,
  }) =>
      getTimeline(
        relativeTimeLineUrlPath: 'home',
        pagination: pagination,
        onlyWithMedia: false,
        onlyLocal: onlyLocal,
        onlyRemote: null,
        requestFeature: getHomeTimelineFeature,
        fieldFeatures: [
          if (pagination?.minId != null) getHomeTimelinePaginationMinIdFeature,
        ],
      );

  @override
  MastodonApiFeature get getHomeTimelineFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get getHomeTimelinePaginationMinIdFeature =>
      getHomeTimelineFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
      );

  @override
  MastodonApiFeature get getListTimelineFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  IMastodonApiFeature get getListTimelinePaginationMinIdFeature =>
      getListTimelineFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
      );
}
