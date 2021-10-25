import '../../account/unifedi_api_account_model.dart';
import '../../emoji/reaction/unifedi_api_emoji_reaction_model.dart';
import '../../feature/unifedi_api_feature_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../unifedi_api_service.dart';
import '../../visibility/unifedi_api_visibility_sealed.dart';
import '../context/unifedi_api_status_context_model.dart';
import '../post/schedule/unifedi_api_schedule_post_status_model.dart';
import '../post/unifedi_api_post_status_model.dart';
import '../scheduled/unifedi_api_scheduled_status_model.dart';
import '../unifedi_api_status_model.dart';

abstract class IUnifediApiStatusService extends IUnifediApiService {
  IUnifediApiFeature get getEmojiReactionsFeature;

  IUnifediApiFeature get getEmojiReactionFeature;

  Future<List<IUnifediApiEmojiReaction>> getEmojiReactions({
    required String statusId,
  });

  Future<IUnifediApiEmojiReaction> getEmojiReaction({
    required String statusId,
    required String emoji,
  });

  IUnifediApiFeature get addEmojiReactionFeature;

  IUnifediApiFeature get removeEmojiReactionFeature;

  Future<IUnifediApiStatus> addEmojiReaction({
    required String statusId,
    required String emoji,
  });

  Future<IUnifediApiStatus> removeEmojiReaction({
    required String statusId,
    required String emoji,
  });

  IUnifediApiFeature get cancelScheduledStatusFeature;

  IUnifediApiFeature get getScheduledStatusFeature;

  IUnifediApiFeature get reScheduleStatusFeature;

  IUnifediApiFeature get getScheduledStatusesFeature;

  Future<void> cancelScheduledStatus({
    required String scheduledStatusId,
  });

  Future<IUnifediApiScheduledStatus> getScheduledStatus({
    required String scheduledStatusId,
  });

  Future<IUnifediApiScheduledStatus> reScheduleStatus({
    required String scheduledStatusId,
    required DateTime scheduledAt,
  });

  Future<List<IUnifediApiScheduledStatus>> getScheduledStatuses({
    IUnifediApiPagination? pagination,
  });

  IUnifediApiFeature get getStatusFeature;

  IUnifediApiFeature get getStatusContextFeature;

  IUnifediApiFeature get favouritedByFeature;

  IUnifediApiFeature get rebloggedByFeature;

  Future<IUnifediApiStatus> getStatus({
    required String statusId,
  });

  Future<IUnifediApiStatusContext> getStatusContext({
    required String statusId,
  });

  Future<List<IUnifediApiAccount>> favouritedBy({
    required String statusId,
    required IUnifediApiPagination? pagination,
  });

  Future<List<IUnifediApiAccount>> rebloggedBy({
    required String statusId,
    required IUnifediApiPagination? pagination,
  });

  IUnifediApiFeature get postStatusFeature;
  IUnifediApiFeature get postStatusInReplyToConversationIdFeature;
  IUnifediApiFeature get postStatusToFeature;
  IUnifediApiFeature get postStatusPreviewFeature;
  IUnifediApiFeature get postStatusContentTypeFeature;
  IUnifediApiFeature get postStatusExpiresInFeature;

  IUnifediApiFeature get postStatusPollFeature;

  IUnifediApiFeature get scheduleStatusFeature;

  IUnifediApiFeature get scheduleStatusPollFeature;

  IUnifediApiFeature get deleteStatusFeature;

  IUnifediApiFeature get muteStatusFeature;

  IUnifediApiFeature get muteStatusExpiresInFeature;

  IUnifediApiFeature get unMuteStatusFeature;

  IUnifediApiFeature get pinStatusFeature;

  IUnifediApiFeature get unPinStatusFeature;

  IUnifediApiFeature get favouriteStatusFeature;

  IUnifediApiFeature get unFavouriteStatusFeature;

  IUnifediApiFeature get bookmarkStatusFeature;

  IUnifediApiFeature get unBookmarkStatusFeature;

  IUnifediApiFeature get reblogStatusFeature;

  IUnifediApiFeature get reblogStatusVisibilityFeature;

  IUnifediApiFeature get unReblogStatusFeature;

  List<UnifediApiVisibility> calculatePossibleStatusVisibility();

  Future<IUnifediApiStatus> postStatus({
    required IUnifediApiPostStatus postStatus,

    /// Prevent duplicate submissions of the same status.
    /// Idempotency keys are stored for up to 1 hour,
    /// and can be any arbitrary string.
    /// Consider using a hash or UUID generated client-side.
    required String? idempotencyKey,
  });

  Future<IUnifediApiScheduledStatus> scheduleStatus({
    required IUnifediApiSchedulePostStatus postStatus,

    /// Prevent duplicate submissions of the same status.
    /// Idempotency keys are stored for up to 1 hour,
    /// and can be any arbitrary string.
    /// Consider using a hash or UUID generated client-side.
    required String? idempotencyKey,
  });

  Future<void> deleteStatus({
    required String statusId,
  });

  Future<IUnifediApiStatus> muteStatus({
    required String statusId,
    required Duration? expiresIn,
  });

  Future<IUnifediApiStatus> unMuteStatus({
    required String statusId,
  });

  Future<IUnifediApiStatus> pinStatus({
    required String statusId,
  });

  Future<IUnifediApiStatus> unPinStatus({
    required String statusId,
  });

  Future<IUnifediApiStatus> favouriteStatus({
    required String statusId,
  });

  Future<IUnifediApiStatus> unFavouriteStatus({
    required String statusId,
  });

  Future<IUnifediApiStatus> bookmarkStatus({
    required String statusId,
  });

  Future<IUnifediApiStatus> unBookmarkStatus({
    required String statusId,
  });

  Future<IUnifediApiStatus> reblogStatus({
    required String statusId,
    required UnifediApiVisibility? visibility,
  });

  Future<IUnifediApiStatus> unReblogStatus({
    required String statusId,
  });
}
