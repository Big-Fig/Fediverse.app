import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../emoji_reaction/pleroma_api_status_emoji_reaction_model.dart';
import '../../../emoji_reaction/pleroma_api_status_emoji_reaction_model_impl.dart';
import '../../../pleroma_api_status_model.dart';
import '../../../pleroma_api_status_model_impl.dart';
import '../../../post/pleroma_api_post_status_model.dart';
import '../../../post/schedule/pleroma_api_schedule_post_status_model.dart';
import '../../../scheduled/pleroma_api_scheduled_status_model.dart';
import '../../../scheduled/pleroma_api_scheduled_status_model_impl.dart';
import '../public/pleroma_api_status_public_access_service_impl.dart';
import 'pleroma_api_status_user_access_service.dart';

class PleromaApiStatusUserAccessService
    extends PleromaApiStatusPublicAccessService
    implements IPleromaApiStatusUserAccessService {
  final MastodonApiStatusUserAccessService mastodonApiStatusUserAccessService;

  PleromaApiStatusUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiStatusUserAccessService = MastodonApiStatusUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiStatusUserAccessService.disposeWith(this);
  }

  @override
  Future<void> deleteStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: deleteStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService.createDeleteStatusRequest(
          statusId: statusId,
        ),
      );

  @override
  Future<IPleromaApiStatus> muteStatus({
    required String statusId,
    required Duration? expiresIn,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: muteStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService
            .createMuteStatusRequest(
          statusId: statusId,
        )
            .copyWith(
          bodyJson: <String, dynamic>{
            if (expiresIn != null)
              'expire_in':
                  expiresIn.inMilliseconds ~/ Duration.millisecondsPerSecond,
          },
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> unMuteStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unMuteStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService.createUnMuteStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> pinStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: pinStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService.createPinStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> unPinStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unPinStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService.unPinStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> reblogStatus({
    required String statusId,
    required PleromaApiVisibility? visibility,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: reblogStatusFeature,
        fieldFeatures: [
          if (visibility != null) reblogStatusVisibilityFeature,
        ],
        request: mastodonApiStatusUserAccessService
            .createReblogStatusRequest(
          statusId: statusId,
          visibility: null,
        )
            .copyWith(
          bodyJson: <String, dynamic>{
            if (visibility != null) 'visibility': visibility.stringValue,
          },
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> unReblogStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unReblogStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService.createUnReblogStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> favouriteStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: favouriteStatusFeature,
        fieldFeatures: null,
        request:
            mastodonApiStatusUserAccessService.createFavouriteStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> unFavouriteStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unFavouriteStatusFeature,
        fieldFeatures: null,
        request:
            mastodonApiStatusUserAccessService.createUnFavouriteStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> bookmarkStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: bookmarkStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService.createBookmarkStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> unBookmarkStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unBookmarkStatusFeature,
        fieldFeatures: null,
        request:
            mastodonApiStatusUserAccessService.createUnBookmarkStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> postStatus({
    required IPleromaApiPostStatus postStatus,
    required String? idempotencyKey,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: postStatusFeature,
        fieldFeatures: [
          if (postStatus.poll != null) postStatusPollFeature,
        ],
        request: mastodonApiStatusUserAccessService.createPostStatusRequest(
          postStatus: postStatus,
          idempotencyKey: idempotencyKey,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiScheduledStatus> scheduleStatus({
    required IPleromaApiSchedulePostStatus postStatus,
    required String? idempotencyKey,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: scheduleStatusFeature,
        fieldFeatures: [
          if (postStatus.poll != null) postStatusPollFeature,
        ],
        request: mastodonApiStatusUserAccessService.createScheduleStatusRequest(
          postStatus: postStatus,
          idempotencyKey: idempotencyKey,
        ),
        jsonParser: (json) => PleromaApiScheduledStatus.fromJson(json),
      );

  @override
  IPleromaApiFeature get bookmarkStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.bookmarkStatusFeature,
      );

  @override
  IPleromaApiFeature get deleteStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.deleteStatusFeature,
      );

  @override
  IPleromaApiFeature get favouriteStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.favouriteStatusFeature,
      );

  @override
  IPleromaApiFeature get muteStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.muteStatusFeature,
      );

  @override
  IPleromaApiFeature get pinStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.pinStatusFeature,
      );

  @override
  IPleromaApiFeature get postStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.postStatusFeature,
      );

  @override
  IPleromaApiFeature get postStatusPollFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.postStatusPollFeature,
      );

  @override
  IPleromaApiFeature get reblogStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.reblogStatusFeature,
      );

  @override
  IPleromaApiFeature get reblogStatusVisibilityFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.reblogStatusVisibilityFeature,
      );

  @override
  IPleromaApiFeature get scheduleStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.scheduleStatusFeature,
      );

  @override
  IPleromaApiFeature get scheduleStatusPollFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.scheduleStatusPollFeature,
      );

  @override
  IPleromaApiFeature get unBookmarkStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.unBookmarkStatusFeature,
      );

  @override
  IPleromaApiFeature get unFavouriteStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.unFavouriteStatusFeature,
      );

  @override
  IPleromaApiFeature get unMuteStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.unMuteStatusFeature,
      );

  @override
  IPleromaApiFeature get unPinStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.unPinStatusFeature,
      );

  @override
  IPleromaApiFeature get unReblogStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.unReblogStatusFeature,
      );

  @override
  Future<IPleromaApiStatus> addEmojiReaction({
    required String statusId,
    required String emoji,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: addEmojiReactionFeature,
        fieldFeatures: null,
        request: RestRequest.put(
          relativePath: UrlPathHelper.join(
            [
              pleromaStatusesRelativeUrlPath,
              statusId,
              reactionsRelativeUrlPath,
              emoji,
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiStatusEmojiReaction> getEmojiReaction({
    required String statusId,
    required String emoji,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getEmojiReactionFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: UrlPathHelper.join(
            [
              pleromaStatusesRelativeUrlPath,
              statusId,
              reactionsRelativeUrlPath,
              emoji,
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiStatusEmojiReaction.fromJson(json),
      );

  @override
  Future<List<IPleromaApiStatusEmojiReaction>> getEmojiReactions({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getEmojiReactionsFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: UrlPathHelper.join(
            [
              pleromaStatusesRelativeUrlPath,
              statusId,
              reactionsRelativeUrlPath,
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiStatusEmojiReaction.fromJson(json),
      );

  @override
  Future<IPleromaApiStatus> removeEmojiReaction({
    required String statusId,
    required String emoji,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: removeEmojiReactionFeature,
        fieldFeatures: null,
        request: RestRequest.delete(
          relativePath: UrlPathHelper.join(
            [
              pleromaStatusesRelativeUrlPath,
              statusId,
              reactionsRelativeUrlPath,
              emoji,
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  IPleromaApiFeature get addEmojiReactionFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  IPleromaApiFeature get removeEmojiReactionFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  Future<IPleromaApiScheduledStatus> getScheduledStatus({
    required String scheduledStatusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getScheduledStatusFeature,
        fieldFeatures: null,
        request:
            mastodonApiStatusUserAccessService.createGetScheduledStatusRequest(
          scheduledStatusId: scheduledStatusId,
        ),
        jsonParser: (json) => PleromaApiScheduledStatus.fromJson(json),
      );

  @override
  Future<void> cancelScheduledStatus({
    required String scheduledStatusId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: cancelScheduledStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService
            .createCancelScheduledStatusRequest(
          scheduledStatusId: scheduledStatusId,
        ),
      );

  @override
  Future<List<IPleromaApiScheduledStatus>> getScheduledStatuses({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getScheduledStatusesFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService
            .createGetScheduledStatusesRequest(
          pagination: pagination,
        ),
        jsonParser: (json) => PleromaApiScheduledStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiScheduledStatus> reScheduleStatus({
    required String scheduledStatusId,
    required DateTime scheduledAt,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: reScheduleStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusUserAccessService.reScheduleStatusRequest(
          scheduledStatusId: scheduledStatusId,
          scheduledAt: scheduledAt,
        ),
        jsonParser: (json) => PleromaApiScheduledStatus.fromJson(json),
      );

  @override
  IPleromaApiFeature get cancelScheduledStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.cancelScheduledStatusFeature,
      );

  @override
  IPleromaApiFeature get getScheduledStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.getScheduledStatusFeature,
      );

  @override
  IPleromaApiFeature get getScheduledStatusesFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.getScheduledStatusesFeature,
      );

  @override
  IPleromaApiFeature get reScheduleStatusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiStatusUserAccessService.reScheduleStatusFeature,
      );

  @override
  List<PleromaApiVisibility> calculatePossibleStatusVisibility() =>
      PleromaApiVisibility.values;
}
