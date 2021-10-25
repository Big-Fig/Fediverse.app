import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../visibility/mastodon_api_visibility_sealed.dart';
import '../../../mastodon_api_status_model.dart';
import '../../../mastodon_api_status_model_impl.dart';
import '../../../post/mastodon_api_post_status_model.dart';
import '../../../post/schedule/mastodon_api_schedule_post_status_model.dart';
import '../../../scheduled/mastodon_api_scheduled_status_model.dart';
import '../../../scheduled/mastodon_api_scheduled_status_model_impl.dart';
import '../public/mastodon_api_status_public_access_service_impl.dart';
import 'mastodon_api_status_user_access_service.dart';

class MastodonApiStatusUserAccessService
    extends MastodonApiStatusPublicAccessService
    implements IMastodonApiStatusUserAccessService {
  final scheduledStatusesRelativeUrlPath = '/api/v1/scheduled_statuses/';

  MastodonApiStatusUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<void> deleteStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: deleteStatusFeature,
        fieldFeatures: null,
        request: createDeleteStatusRequest(
          statusId: statusId,
        ),
      );

  RestRequest createDeleteStatusRequest({
    required String statusId,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> muteStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: muteStatusFeature,
        fieldFeatures: null,
        request: createMuteStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createMuteStatusRequest({
    required String statusId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'mute',
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> unMuteStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unMuteStatusFeature,
        fieldFeatures: null,
        request: createUnMuteStatusRequest(statusId: statusId),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createUnMuteStatusRequest({
    required String statusId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'unmute',
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> pinStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: pinStatusFeature,
        fieldFeatures: null,
        request: createPinStatusRequest(statusId: statusId),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createPinStatusRequest({
    required String statusId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'pin',
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> unPinStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unPinStatusFeature,
        fieldFeatures: null,
        request: unPinStatusRequest(statusId: statusId),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest unPinStatusRequest({
    required String statusId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'unpin',
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> reblogStatus({
    required String statusId,
    required MastodonApiVisibility? visibility,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: reblogStatusFeature,
        fieldFeatures: [
          if (visibility != null) reblogStatusVisibilityFeature,
        ],
        request: createReblogStatusRequest(
          statusId: statusId,
          visibility: visibility,
        ),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createReblogStatusRequest({
    required String statusId,
    required MastodonApiVisibility? visibility,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'reblog',
          ],
        ),
        bodyJson: <String, dynamic>{
          if (visibility != null) 'visibility': visibility.stringValue,
        },
      );

  @override
  Future<IMastodonApiStatus> unReblogStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unReblogStatusFeature,
        fieldFeatures: null,
        request: createUnReblogStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createUnReblogStatusRequest({
    required String statusId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'unreblog',
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> favouriteStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: favouriteStatusFeature,
        fieldFeatures: null,
        request: createFavouriteStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createFavouriteStatusRequest({
    required String statusId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'favourite',
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> unFavouriteStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unFavouriteStatusFeature,
        fieldFeatures: null,
        request: createUnFavouriteStatusRequest(statusId: statusId),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createUnFavouriteStatusRequest({
    required String statusId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'unfavourite',
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> bookmarkStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: bookmarkStatusFeature,
        fieldFeatures: null,
        request: createBookmarkStatusRequest(statusId: statusId),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createBookmarkStatusRequest({
    required String statusId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'bookmark',
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> unBookmarkStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unBookmarkStatusFeature,
        fieldFeatures: null,
        request: createUnBookmarkStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createUnBookmarkStatusRequest({
    required String statusId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            statusRelativeUrlPath,
            statusId,
            'unbookmark',
          ],
        ),
      );

  @override
  Future<IMastodonApiStatus> postStatus({
    required IMastodonApiPostStatus postStatus,
    required String? idempotencyKey,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: postStatusFeature,
        fieldFeatures: [
          if (postStatus.poll != null) postStatusPollFeature,
        ],
        request: createPostStatusRequest(
          postStatus: postStatus,
          idempotencyKey: idempotencyKey,
        ),
        jsonParser: (json) => MastodonApiStatus.fromJson(json),
      );

  RestRequest createPostStatusRequest({
    required IMastodonApiPostStatus postStatus,
    required String? idempotencyKey,
  }) {
    _assertContent(postStatus);

    return RestRequest.post(
      relativePath: statusRelativeUrlPath,
      headers: [
        if (idempotencyKey != null && idempotencyKey.isNotEmpty)
          RestHeader(
            key: 'Idempotency-Key',
            value: idempotencyKey,
          ),
      ],
      bodyJson: postStatus.toJson(),
    );
  }

  void _assertContent(IMastodonApiBasePostStatus postStatus) {
    var isPollExist = postStatus.poll != null;
    var isMediaExist = postStatus.mediaIds?.isNotEmpty == true;
    var isTextExist = postStatus.status?.isNotEmpty == true;

    assert(
      !(isPollExist && isMediaExist),
      'poll & media cant be set in one time',
    );

    assert(
      isPollExist || isMediaExist || isTextExist,
      'media, poll or status should exist',
    );
  }

  @override
  Future<IMastodonApiScheduledStatus> scheduleStatus({
    required IMastodonApiSchedulePostStatus postStatus,
    required String? idempotencyKey,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: scheduleStatusFeature,
        fieldFeatures: [
          if (postStatus.poll != null) postStatusPollFeature,
        ],
        request: createScheduleStatusRequest(
          postStatus: postStatus,
          idempotencyKey: idempotencyKey,
        ),
        jsonParser: (json) => MastodonApiScheduledStatus.fromJson(json),
      );

  RestRequest createScheduleStatusRequest({
    required IMastodonApiSchedulePostStatus postStatus,
    required String? idempotencyKey,
  }) {
    _assertContent(postStatus);

    return RestRequest.post(
      relativePath: statusRelativeUrlPath,
      headers: [
        if (idempotencyKey != null && idempotencyKey.isNotEmpty)
          RestHeader(
            key: 'Idempotency-Key',
            value: idempotencyKey,
          ),
      ],
      bodyJson: postStatus.toJson(),
    );
  }

  @override
  IMastodonApiFeature get bookmarkStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get deleteStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get favouriteStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFavourites,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get muteStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeMutes,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get pinStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  MastodonApiFeature get postStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get postStatusPollFeature => postStatusFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_8_0,
      );

  @override
  MastodonApiFeature get reblogStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get reblogStatusVisibilityFeature =>
      reblogStatusFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_8_0,
      );

  @override
  MastodonApiFeature get scheduleStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_7_0,
      );

  @override
  IMastodonApiFeature get scheduleStatusPollFeature =>
      scheduleStatusFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_8_0,
      );

  @override
  IMastodonApiFeature get unBookmarkStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.none,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get unFavouriteStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFavourites,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get unMuteStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeMutes,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get unPinStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get unReblogStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  Future<IMastodonApiScheduledStatus> getScheduledStatus({
    required String scheduledStatusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getScheduledStatusFeature,
        fieldFeatures: null,
        request: createGetScheduledStatusRequest(
          scheduledStatusId: scheduledStatusId,
        ),
        jsonParser: (json) => MastodonApiScheduledStatus.fromJson(json),
      );

  RestRequest createGetScheduledStatusRequest({
    required String scheduledStatusId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            scheduledStatusesRelativeUrlPath,
            scheduledStatusId,
          ],
        ),
      );

  @override
  Future<void> cancelScheduledStatus({
    required String scheduledStatusId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: cancelScheduledStatusFeature,
        fieldFeatures: null,
        request: createCancelScheduledStatusRequest(
          scheduledStatusId: scheduledStatusId,
        ),
      );

  RestRequest createCancelScheduledStatusRequest({
    required String scheduledStatusId,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join(
          [
            scheduledStatusesRelativeUrlPath,
            scheduledStatusId,
          ],
        ),
      );

  @override
  Future<List<IMastodonApiScheduledStatus>> getScheduledStatuses({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getScheduledStatusesFeature,
        fieldFeatures: null,
        request: createGetScheduledStatusesRequest(
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiScheduledStatus.fromJson(json),
      );

  RestRequest createGetScheduledStatusesRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: scheduledStatusesRelativeUrlPath,
        queryArgs: pagination?.toQueryArgs(),
      );

  @override
  Future<IMastodonApiScheduledStatus> reScheduleStatus({
    required String scheduledStatusId,
    required DateTime scheduledAt,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: reScheduleStatusFeature,
        fieldFeatures: null,
        request: reScheduleStatusRequest(
          scheduledStatusId: scheduledStatusId,
          scheduledAt: scheduledAt,
        ),
        jsonParser: (json) => MastodonApiScheduledStatus.fromJson(json),
      );

  RestRequest reScheduleStatusRequest({
    required String scheduledStatusId,
    required DateTime scheduledAt,
  }) =>
      RestRequest.put(
        relativePath: UrlPathHelper.join(
          [
            scheduledStatusesRelativeUrlPath,
            scheduledStatusId,
          ],
        ),
        bodyJson: <String, dynamic>{
          'scheduled_at': scheduledAt,
        },
      );

  @override
  IMastodonApiFeature get cancelScheduledStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_7_0,
      );

  @override
  IMastodonApiFeature get getScheduledStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_7_0,
      );

  @override
  IMastodonApiFeature get getScheduledStatusesFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_7_0,
      );

  @override
  IMastodonApiFeature get reScheduleStatusFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_7_0,
      );

  @override
  List<MastodonApiVisibility> calculatePossibleStatusVisibility() =>
      MastodonApiVisibility.values;
}
