import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/emoji/reaction/unifedi_api_emoji_reaction_model.dart';
import '../../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/status/context/unifedi_api_status_context_model.dart';
import '../../../api/status/post/schedule/unifedi_api_schedule_post_status_model.dart';
import '../../../api/status/post/unifedi_api_post_status_model.dart';
import '../../../api/status/scheduled/unifedi_api_scheduled_status_model.dart';
import '../../../api/status/service/unifedi_api_status_service.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../../api/visibility/unifedi_api_visibility_sealed.dart';
import '../../account/unifedi_api_account_model_pleroma_adapter.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../../visibility/unifedi_api_visibility_sealed_pleroma_converter.dart';
import '../context/unifedi_api_status_context_model_pleroma_adapter.dart';
import '../emoji_reaction/unifedi_api_status_emoji_reaction_model_pleroma_adapter.dart';
import '../post/schedule/unifedi_api_schedule_post_status_model_pleroma_adapter.dart';
import '../post/unifedi_api_post_status_model_pleroma_adapter.dart';
import '../scheduled/unifedi_api_scheduled_status_model_pleroma_adapter.dart';
import '../unifedi_api_status_model_pleroma_adapter.dart';

class UnifediApiStatusServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiStatusService {
  final IPleromaApiStatusUserAccessService pleromaApiStatusUserAccessService;

  UnifediApiStatusServicePleromaAdapter({
    required this.pleromaApiStatusUserAccessService,
  });

  @override
  Future<IUnifediApiStatus> addEmojiReaction({
    required String statusId,
    required String emoji,
  }) =>
      pleromaApiStatusUserAccessService
          .addEmojiReaction(
            statusId: statusId,
            emoji: emoji,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get addEmojiReactionFeature =>
      pleromaApiStatusUserAccessService.addEmojiReactionFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> bookmarkStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService.bookmarkStatus(statusId: statusId).then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get bookmarkStatusFeature =>
      pleromaApiStatusUserAccessService.bookmarkStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> cancelScheduledStatus({
    required String scheduledStatusId,
  }) =>
      pleromaApiStatusUserAccessService.cancelScheduledStatus(
        scheduledStatusId: scheduledStatusId,
      );

  @override
  IUnifediApiFeature get cancelScheduledStatusFeature =>
      pleromaApiStatusUserAccessService.cancelScheduledStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> deleteStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService.deleteStatus(
        statusId: statusId,
      );

  @override
  IUnifediApiFeature get deleteStatusFeature =>
      pleromaApiStatusUserAccessService.deleteStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> favouriteStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .favouriteStatus(statusId: statusId)
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get favouriteStatusFeature =>
      pleromaApiStatusUserAccessService.favouriteStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccount>> favouritedBy({
    required String statusId,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiStatusUserAccessService
          .favouritedBy(
            statusId: statusId,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get favouritedByFeature =>
      pleromaApiStatusUserAccessService.favouritedByFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiEmojiReaction> getEmojiReaction({
    required String statusId,
    required String emoji,
  }) =>
      pleromaApiStatusUserAccessService
          .getEmojiReaction(
            statusId: statusId,
            emoji: emoji,
          )
          .then(
            (value) => value.toUnifediApiStatusEmojiReactionPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getEmojiReactionFeature =>
      pleromaApiStatusUserAccessService.getEmojiReactionFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiEmojiReaction>> getEmojiReactions({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .getEmojiReactions(
            statusId: statusId,
          )
          .then(
            (value) =>
                value.toUnifediApiStatusEmojiReactionPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getEmojiReactionsFeature =>
      pleromaApiStatusUserAccessService.getEmojiReactionsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiScheduledStatus> getScheduledStatus({
    required String scheduledStatusId,
  }) =>
      pleromaApiStatusUserAccessService
          .getScheduledStatus(
            scheduledStatusId: scheduledStatusId,
          )
          .then(
            (value) => value.toUnifediApiScheduledStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getScheduledStatusFeature =>
      pleromaApiStatusUserAccessService.getScheduledStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiScheduledStatus>> getScheduledStatuses({
    IUnifediApiPagination? pagination,
  }) =>
      pleromaApiStatusUserAccessService
          .getScheduledStatuses(
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiScheduledStatusPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getScheduledStatusesFeature =>
      pleromaApiStatusUserAccessService.getScheduledStatusesFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> getStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .getStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  Future<IUnifediApiStatusContext> getStatusContext({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .getStatusContext(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusContextPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getStatusContextFeature =>
      pleromaApiStatusUserAccessService.getStatusContextFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getStatusFeature =>
      pleromaApiStatusUserAccessService.getStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> muteStatus({
    required String statusId,
    required Duration? expiresIn,
  }) =>
      pleromaApiStatusUserAccessService
          .muteStatus(
            statusId: statusId,
            expiresIn: expiresIn,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get muteStatusFeature =>
      pleromaApiStatusUserAccessService.muteStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> pinStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .pinStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get pinStatusFeature =>
      pleromaApiStatusUserAccessService.pinStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> postStatus({
    required IUnifediApiPostStatus postStatus,
    required String? idempotencyKey,
  }) =>
      pleromaApiStatusUserAccessService
          .postStatus(
            postStatus: postStatus.toPleromaApiPostStatus(),
            idempotencyKey: idempotencyKey,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get postStatusFeature =>
      pleromaApiStatusUserAccessService.postStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get postStatusPollFeature =>
      pleromaApiStatusUserAccessService.postStatusPollFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiScheduledStatus> reScheduleStatus({
    required String scheduledStatusId,
    required DateTime scheduledAt,
  }) =>
      pleromaApiStatusUserAccessService
          .reScheduleStatus(
            scheduledStatusId: scheduledStatusId,
            scheduledAt: scheduledAt,
          )
          .then(
            (value) => value.toUnifediApiScheduledStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get reScheduleStatusFeature =>
      pleromaApiStatusUserAccessService.reScheduleStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> reblogStatus({
    required String statusId,
    required UnifediApiVisibility? visibility,
  }) =>
      pleromaApiStatusUserAccessService
          .reblogStatus(
            statusId: statusId,
            visibility: visibility?.toPleromaApiVisibility(),
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get reblogStatusFeature =>
      pleromaApiStatusUserAccessService.reblogStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get reblogStatusVisibilityFeature =>
      pleromaApiStatusUserAccessService.reblogStatusVisibilityFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccount>> rebloggedBy({
    required String statusId,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiStatusUserAccessService
          .rebloggedBy(
            statusId: statusId,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get rebloggedByFeature =>
      pleromaApiStatusUserAccessService.rebloggedByFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> removeEmojiReaction({
    required String statusId,
    required String emoji,
  }) =>
      pleromaApiStatusUserAccessService
          .removeEmojiReaction(
            statusId: statusId,
            emoji: emoji,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get removeEmojiReactionFeature =>
      pleromaApiStatusUserAccessService.removeEmojiReactionFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiStatusUserAccessService.restService,
      );

  @override
  Future<IUnifediApiScheduledStatus> scheduleStatus({
    required IUnifediApiSchedulePostStatus postStatus,
    required String? idempotencyKey,
  }) =>
      pleromaApiStatusUserAccessService
          .scheduleStatus(
            postStatus: postStatus.toPleromaApiSchedulePostStatus(),
            idempotencyKey: idempotencyKey,
          )
          .then(
            (value) => value.toUnifediApiScheduledStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get scheduleStatusFeature =>
      pleromaApiStatusUserAccessService.scheduleStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get scheduleStatusPollFeature =>
      pleromaApiStatusUserAccessService.scheduleStatusPollFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> unBookmarkStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .unBookmarkStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unBookmarkStatusFeature =>
      pleromaApiStatusUserAccessService.unBookmarkStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> unFavouriteStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .unFavouriteStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unFavouriteStatusFeature =>
      pleromaApiStatusUserAccessService.unFavouriteStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> unMuteStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .unMuteStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unMuteStatusFeature =>
      pleromaApiStatusUserAccessService.unMuteStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> unPinStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .unPinStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unPinStatusFeature =>
      pleromaApiStatusUserAccessService.unPinStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiStatus> unReblogStatus({
    required String statusId,
  }) =>
      pleromaApiStatusUserAccessService
          .unReblogStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unReblogStatusFeature =>
      pleromaApiStatusUserAccessService.unReblogStatusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get muteStatusExpiresInFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get postStatusContentTypeFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get postStatusExpiresInFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get postStatusInReplyToConversationIdFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get postStatusPreviewFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get postStatusToFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  List<UnifediApiVisibility> calculatePossibleStatusVisibility() =>
      pleromaApiStatusUserAccessService
          .calculatePossibleStatusVisibility()
          .toUnifediApiVisibilityList();
}
