import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/emoji/reaction/unifedi_api_emoji_reaction_model.dart';
import '../../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
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
import '../../account/unifedi_api_account_model_mastodon_adapter.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../../visibility/unifedi_api_visibility_sealed_mastodon_converter.dart';
import '../context/unifedi_api_status_context_model_mastodon_adapter.dart';
import '../post/schedule/unifedi_api_schedule_post_status_model_mastodon_adapter.dart';
import '../post/unifedi_api_post_status_model_mastodon_adapter.dart';
import '../scheduled/unifedi_api_scheduled_status_model_mastodon_adapter.dart';
import '../unifedi_api_status_model_mastodon_adapter.dart';

class UnifediApiStatusServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiStatusService {
  final IMastodonApiStatusUserAccessService mastodonApiStatusUserAccessService;

  UnifediApiStatusServiceMastodonAdapter({
    required this.mastodonApiStatusUserAccessService,
  });

  @override
  Future<IUnifediApiStatus> addEmojiReaction({
    required String statusId,
    required String emoji,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: addEmojiReactionFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get addEmojiReactionFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'addEmojiReactionFeature',
      );

  @override
  Future<IUnifediApiStatus> bookmarkStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .bookmarkStatus(statusId: statusId)
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get bookmarkStatusFeature =>
      mastodonApiStatusUserAccessService.bookmarkStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> cancelScheduledStatus({
    required String scheduledStatusId,
  }) =>
      mastodonApiStatusUserAccessService.cancelScheduledStatus(
        scheduledStatusId: scheduledStatusId,
      );

  @override
  IUnifediApiFeature get cancelScheduledStatusFeature =>
      mastodonApiStatusUserAccessService.cancelScheduledStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> deleteStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService.deleteStatus(
        statusId: statusId,
      );

  @override
  IUnifediApiFeature get deleteStatusFeature =>
      mastodonApiStatusUserAccessService.deleteStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> favouriteStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .favouriteStatus(statusId: statusId)
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get favouriteStatusFeature =>
      mastodonApiStatusUserAccessService.favouriteStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccount>> favouritedBy({
    required String statusId,
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiStatusUserAccessService
          .favouritedBy(
            statusId: statusId,
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get favouritedByFeature =>
      mastodonApiStatusUserAccessService.favouritedByFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiEmojiReaction> getEmojiReaction({
    required String statusId,
    required String emoji,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getEmojiReactionFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getEmojiReactionFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getEmojiReactionFeature',
      );

  @override
  Future<List<IUnifediApiEmojiReaction>> getEmojiReactions({
    required String statusId,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getEmojiReactionsFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getEmojiReactionsFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getEmojiReactionsFeature',
      );

  @override
  Future<IUnifediApiScheduledStatus> getScheduledStatus({
    required String scheduledStatusId,
  }) =>
      mastodonApiStatusUserAccessService
          .getScheduledStatus(
            scheduledStatusId: scheduledStatusId,
          )
          .then(
            (value) => value.toUnifediApiScheduledStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get getScheduledStatusFeature =>
      mastodonApiStatusUserAccessService.getScheduledStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiScheduledStatus>> getScheduledStatuses({
    IUnifediApiPagination? pagination,
  }) =>
      mastodonApiStatusUserAccessService
          .getScheduledStatuses(
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiScheduledStatusMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getScheduledStatusesFeature =>
      mastodonApiStatusUserAccessService.getScheduledStatusesFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> getStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .getStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  Future<IUnifediApiStatusContext> getStatusContext({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .getStatusContext(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusContextMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get getStatusContextFeature =>
      mastodonApiStatusUserAccessService.getStatusContextFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getStatusFeature =>
      mastodonApiStatusUserAccessService.getStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> muteStatus({
    required String statusId,
    required Duration? expiresIn,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: expiresIn,
      feature: muteStatusExpiresInFeature,
    );

    return mastodonApiStatusUserAccessService
        .muteStatus(
          statusId: statusId,
        )
        .then(
          (value) => value.toUnifediApiStatusMastodonAdapter(),
        );
  }

  @override
  IUnifediApiFeature get muteStatusFeature =>
      mastodonApiStatusUserAccessService.muteStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  UnifediApiTypeNotSupportedFeature get muteStatusExpiresInFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'muteStatusExpiresInFeature',
      );

  @override
  Future<IUnifediApiStatus> pinStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .pinStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get pinStatusFeature =>
      mastodonApiStatusUserAccessService.pinStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> postStatus({
    required IUnifediApiPostStatus postStatus,
    required String? idempotencyKey,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: postStatus.inReplyToConversationId,
      feature: postStatusInReplyToConversationIdFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: postStatus.to,
      feature: postStatusToFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: postStatus.preview,
      feature: postStatusPreviewFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: postStatus.contentType,
      feature: postStatusContentTypeFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: postStatus.expiresInSeconds,
      feature: postStatusExpiresInFeature,
    );

    return mastodonApiStatusUserAccessService
        .postStatus(
          postStatus: postStatus.toMastodonApiPostStatus(),
          idempotencyKey: idempotencyKey,
        )
        .then(
          (value) => value.toUnifediApiStatusMastodonAdapter(),
        );
  }

  @override
  IUnifediApiFeature get postStatusFeature =>
      mastodonApiStatusUserAccessService.postStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get postStatusPollFeature =>
      mastodonApiStatusUserAccessService.postStatusPollFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiScheduledStatus> reScheduleStatus({
    required String scheduledStatusId,
    required DateTime scheduledAt,
  }) =>
      mastodonApiStatusUserAccessService
          .reScheduleStatus(
            scheduledStatusId: scheduledStatusId,
            scheduledAt: scheduledAt,
          )
          .then(
            (value) => value.toUnifediApiScheduledStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get reScheduleStatusFeature =>
      mastodonApiStatusUserAccessService.reScheduleStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> reblogStatus({
    required String statusId,
    required UnifediApiVisibility? visibility,
  }) =>
      mastodonApiStatusUserAccessService
          .reblogStatus(
            statusId: statusId,
            visibility: visibility?.toMastodonApiVisibility(),
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get reblogStatusFeature =>
      mastodonApiStatusUserAccessService.reblogStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get reblogStatusVisibilityFeature =>
      mastodonApiStatusUserAccessService.reblogStatusVisibilityFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccount>> rebloggedBy({
    required String statusId,
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiStatusUserAccessService
          .rebloggedBy(
            statusId: statusId,
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get rebloggedByFeature =>
      mastodonApiStatusUserAccessService.rebloggedByFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> removeEmojiReaction({
    required String statusId,
    required String emoji,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: removeEmojiReactionFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get removeEmojiReactionFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'removeEmojiReactionFeature',
      );

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService: mastodonApiStatusUserAccessService.restService,
      );

  @override
  Future<IUnifediApiScheduledStatus> scheduleStatus({
    required IUnifediApiSchedulePostStatus postStatus,
    required String? idempotencyKey,
  }) =>
      mastodonApiStatusUserAccessService
          .scheduleStatus(
            postStatus: postStatus.toMastodonApiSchedulePostStatus(),
            idempotencyKey: idempotencyKey,
          )
          .then(
            (value) => value.toUnifediApiScheduledStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get scheduleStatusFeature =>
      mastodonApiStatusUserAccessService.scheduleStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get scheduleStatusPollFeature =>
      mastodonApiStatusUserAccessService.scheduleStatusPollFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> unBookmarkStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .unBookmarkStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get unBookmarkStatusFeature =>
      mastodonApiStatusUserAccessService.unBookmarkStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> unFavouriteStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .unFavouriteStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get unFavouriteStatusFeature =>
      mastodonApiStatusUserAccessService.unFavouriteStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> unMuteStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .unMuteStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get unMuteStatusFeature =>
      mastodonApiStatusUserAccessService.unMuteStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> unPinStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .unPinStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get unPinStatusFeature =>
      mastodonApiStatusUserAccessService.unPinStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiStatus> unReblogStatus({
    required String statusId,
  }) =>
      mastodonApiStatusUserAccessService
          .unReblogStatus(
            statusId: statusId,
          )
          .then(
            (value) => value.toUnifediApiStatusMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get unReblogStatusFeature =>
      mastodonApiStatusUserAccessService.unReblogStatusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  UnifediApiTypeNotSupportedFeature get postStatusContentTypeFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'postStatusContentTypeFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get postStatusExpiresInFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'postStatusExpiresInFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get postStatusInReplyToConversationIdFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'postStatusInReplyToConversationIdFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature get postStatusPreviewFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'postStatusPreviewFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get postStatusToFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'postStatusToFeature',
      );

  @override
  List<UnifediApiVisibility> calculatePossibleStatusVisibility() =>
      mastodonApiStatusUserAccessService
          .calculatePossibleStatusVisibility()
          .toMastodonApiVisibilityList();
}
