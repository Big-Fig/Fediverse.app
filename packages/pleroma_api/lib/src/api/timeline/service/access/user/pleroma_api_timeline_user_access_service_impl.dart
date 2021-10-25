import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../status/pleroma_api_status_model.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../../visibility/reply_filter/pleroma_api_timeline_reply_visibility_filter_model.dart';
import '../public/pleroma_api_timeline_public_access_service_impl.dart';
import 'pleroma_api_timeline_user_access_service.dart';

class PleromaApiTimelineUserAccessService
    extends PleromaApiTimelinePublicAccessService
    implements IPleromaApiTimelineUserAccessService {
  final MastodonApiTimelineUserAccessService
      mastodonApiTimelineUserAccessService;

  PleromaApiTimelineUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiTimelineUserAccessService =
            MastodonApiTimelineUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiTimelineUserAccessService.disposeWith(this);
  }

  @override
  Future<List<IPleromaApiStatus>> getListTimeline({
    required String listId,
    required IPleromaApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<PleromaApiVisibility>? excludeVisibilities,
  }) =>
      getTimeline(
        relativeTimeLineUrlPath: 'list/$listId',
        pagination: pagination,
        onlyWithMedia: null,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        replyVisibilityFilter: null,
        onlyFromInstance: null,
        onlyRemote: null,
        requestFeature: getListTimelineFeature,
        fieldFeatures: [
          if (pagination?.minId != null) getListTimelinePaginationMinIdFeature,
        ],
      );

  @override
  Future<List<IPleromaApiStatus>> getHomeTimeline({
    required IPleromaApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<PleromaApiVisibility>? excludeVisibilities,
    required PleromaApiReplyVisibilityFilter? replyVisibilityFilter,
  }) =>
      getTimeline(
        relativeTimeLineUrlPath: 'home',
        pagination: pagination,
        onlyWithMedia: false,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities,
        replyVisibilityFilter: replyVisibilityFilter,
        onlyFromInstance: null,
        onlyRemote: null,
        requestFeature: getHomeTimelineFeature,
        fieldFeatures: [
          if (pagination?.minId != null) getHomeTimelinePaginationMinIdFeature,
        ],
      );

  @override
  IPleromaApiFeature get getHomeTimelineFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiTimelineUserAccessService.getHomeTimelineFeature,
      );

  @override
  IPleromaApiFeature get getHomeTimelinePaginationMinIdFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiTimelineUserAccessService
            .getHomeTimelinePaginationMinIdFeature,
      );

  @override
  IPleromaApiFeature get getListTimelineFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiTimelineUserAccessService.getListTimelineFeature,
      );

  @override
  IPleromaApiFeature get getListTimelinePaginationMinIdFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiTimelineUserAccessService
            .getListTimelinePaginationMinIdFeature,
      );
}
