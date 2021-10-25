import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../pleroma_api_status_model.dart';
import '../../../post/pleroma_api_post_status_model.dart';
import '../../../post/schedule/pleroma_api_schedule_post_status_model.dart';
import '../../../scheduled/pleroma_api_scheduled_status_model.dart';
import '../public/pleroma_api_status_public_access_service.dart';

abstract class IPleromaApiStatusUserAccessService
    extends IPleromaApiStatusPublicAccessService {
  List<PleromaApiVisibility> calculatePossibleStatusVisibility();

  IPleromaApiFeature get addEmojiReactionFeature;

  IPleromaApiFeature get removeEmojiReactionFeature;

  Future<IPleromaApiStatus> addEmojiReaction({
    required String statusId,
    required String emoji,
  });

  Future<IPleromaApiStatus> removeEmojiReaction({
    required String statusId,
    required String emoji,
  });

  IPleromaApiFeature get postStatusFeature;

  IPleromaApiFeature get postStatusPollFeature;

  IPleromaApiFeature get scheduleStatusFeature;

  IPleromaApiFeature get scheduleStatusPollFeature;

  IPleromaApiFeature get deleteStatusFeature;

  IPleromaApiFeature get muteStatusFeature;

  IPleromaApiFeature get unMuteStatusFeature;

  IPleromaApiFeature get pinStatusFeature;

  IPleromaApiFeature get unPinStatusFeature;

  IPleromaApiFeature get favouriteStatusFeature;

  IPleromaApiFeature get unFavouriteStatusFeature;

  IPleromaApiFeature get bookmarkStatusFeature;

  IPleromaApiFeature get unBookmarkStatusFeature;

  IPleromaApiFeature get reblogStatusFeature;

  IPleromaApiFeature get reblogStatusVisibilityFeature;

  IPleromaApiFeature get unReblogStatusFeature;

  Future<IPleromaApiStatus> postStatus({
    required IPleromaApiPostStatus postStatus,

    /// Prevent duplicate submissions of the same status.
    /// Idempotency keys are stored for up to 1 hour,
    /// and can be any arbitrary string.
    /// Consider using a hash or UUID generated client-side.
    required String? idempotencyKey,
  });

  Future<IPleromaApiScheduledStatus> scheduleStatus({
    required IPleromaApiSchedulePostStatus postStatus,

    /// Prevent duplicate submissions of the same status.
    /// Idempotency keys are stored for up to 1 hour,
    /// and can be any arbitrary string.
    /// Consider using a hash or UUID generated client-side.
    required String? idempotencyKey,
  });

  Future<void> deleteStatus({
    required String statusId,
  });

  Future<IPleromaApiStatus> muteStatus({
    required String statusId,
    required Duration? expiresIn,
  });

  Future<IPleromaApiStatus> unMuteStatus({
    required String statusId,
  });

  Future<IPleromaApiStatus> pinStatus({
    required String statusId,
  });

  Future<IPleromaApiStatus> unPinStatus({
    required String statusId,
  });

  Future<IPleromaApiStatus> favouriteStatus({
    required String statusId,
  });

  Future<IPleromaApiStatus> unFavouriteStatus({
    required String statusId,
  });

  Future<IPleromaApiStatus> bookmarkStatus({
    required String statusId,
  });

  Future<IPleromaApiStatus> unBookmarkStatus({
    required String statusId,
  });

  Future<IPleromaApiStatus> reblogStatus({
    required String statusId,
    required PleromaApiVisibility? visibility,
  });

  Future<IPleromaApiStatus> unReblogStatus({
    required String statusId,
  });

  IPleromaApiFeature get cancelScheduledStatusFeature;

  IPleromaApiFeature get getScheduledStatusFeature;

  IPleromaApiFeature get reScheduleStatusFeature;

  IPleromaApiFeature get getScheduledStatusesFeature;

  Future<void> cancelScheduledStatus({
    required String scheduledStatusId,
  });

  Future<IPleromaApiScheduledStatus> getScheduledStatus({
    required String scheduledStatusId,
  });

  Future<IPleromaApiScheduledStatus> reScheduleStatus({
    required String scheduledStatusId,
    required DateTime scheduledAt,
  });

  Future<List<IPleromaApiScheduledStatus>> getScheduledStatuses({
    required IPleromaApiPagination? pagination,
  });
}
