import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../visibility/mastodon_api_visibility_sealed.dart';
import '../../../mastodon_api_status_model.dart';
import '../../../post/mastodon_api_post_status_model.dart';
import '../../../post/schedule/mastodon_api_schedule_post_status_model.dart';
import '../../../scheduled/mastodon_api_scheduled_status_model.dart';
import '../public/mastodon_api_status_public_access_service.dart';

abstract class IMastodonApiStatusUserAccessService
    extends IMastodonApiStatusPublicAccessService {
  List<MastodonApiVisibility> calculatePossibleStatusVisibility();

  IMastodonApiFeature get cancelScheduledStatusFeature;

  IMastodonApiFeature get getScheduledStatusFeature;

  IMastodonApiFeature get reScheduleStatusFeature;

  IMastodonApiFeature get getScheduledStatusesFeature;

  Future<void> cancelScheduledStatus({
    required String scheduledStatusId,
  });

  Future<IMastodonApiScheduledStatus> getScheduledStatus({
    required String scheduledStatusId,
  });

  Future<IMastodonApiScheduledStatus> reScheduleStatus({
    required String scheduledStatusId,
    required DateTime scheduledAt,
  });

  Future<List<IMastodonApiScheduledStatus>> getScheduledStatuses({
    required IMastodonApiPagination? pagination,
  });

  IMastodonApiFeature get postStatusFeature;

  IMastodonApiFeature get postStatusPollFeature;

  IMastodonApiFeature get scheduleStatusFeature;

  IMastodonApiFeature get scheduleStatusPollFeature;

  IMastodonApiFeature get deleteStatusFeature;

  IMastodonApiFeature get muteStatusFeature;

  IMastodonApiFeature get unMuteStatusFeature;

  IMastodonApiFeature get pinStatusFeature;

  IMastodonApiFeature get unPinStatusFeature;

  IMastodonApiFeature get favouriteStatusFeature;

  IMastodonApiFeature get unFavouriteStatusFeature;

  IMastodonApiFeature get bookmarkStatusFeature;

  IMastodonApiFeature get unBookmarkStatusFeature;

  IMastodonApiFeature get reblogStatusFeature;

  IMastodonApiFeature get reblogStatusVisibilityFeature;

  IMastodonApiFeature get unReblogStatusFeature;

  Future<IMastodonApiStatus> postStatus({
    required IMastodonApiPostStatus postStatus,

    /// Prevent duplicate submissions of the same status.
    /// Idempotency keys are stored for up to 1 hour,
    /// and can be any arbitrary string.
    /// Consider using a hash or UUID generated client-side.
    required String? idempotencyKey,
  });

  Future<IMastodonApiScheduledStatus> scheduleStatus({
    required IMastodonApiSchedulePostStatus postStatus,

    /// Prevent duplicate submissions of the same status.
    /// Idempotency keys are stored for up to 1 hour,
    /// and can be any arbitrary string.
    /// Consider using a hash or UUID generated client-side.
    required String? idempotencyKey,
  });

  Future deleteStatus({
    required String statusId,
  });

  Future<IMastodonApiStatus> muteStatus({
    required String statusId,
  });

  Future<IMastodonApiStatus> unMuteStatus({
    required String statusId,
  });

  Future<IMastodonApiStatus> pinStatus({
    required String statusId,
  });

  Future<IMastodonApiStatus> unPinStatus({
    required String statusId,
  });

  Future<IMastodonApiStatus> favouriteStatus({
    required String statusId,
  });

  Future<IMastodonApiStatus> unFavouriteStatus({
    required String statusId,
  });

  Future<IMastodonApiStatus> bookmarkStatus({
    required String statusId,
  });

  Future<IMastodonApiStatus> unBookmarkStatus({
    required String statusId,
  });

  Future<IMastodonApiStatus> reblogStatus({
    required String statusId,
    required MastodonApiVisibility? visibility,
  });

  Future<IMastodonApiStatus> unReblogStatus({
    required String statusId,
  });
}
