import '../../feature/unifedi_api_feature_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../status/unifedi_api_status_model.dart';
import '../../unifedi_api_service.dart';
import '../../visibility/reply_filter/unifedi_api_timeline_reply_visibility_filter_model.dart';
import '../../visibility/unifedi_api_visibility_sealed.dart';

abstract class IUnifediApiTimelineService implements IUnifediApiService {
  List<UnifediApiVisibility> calculatePossibleExcludeVisibilitiesValues();

  IUnifediApiFeature get getPublicTimelineFeature;

  IUnifediApiFeature get getPublicTimelineOnlyMediaFeature;

  IUnifediApiFeature get getPublicTimelinePaginationMinIdFeature;

  IUnifediApiFeature get getPublicTimelineOnlyRemoteFeature;

  IUnifediApiFeature get getPublicTimelineWithMutedFeature;

  IUnifediApiFeature get getPublicTimelineExcludeVisibilitiesFeature;

  IUnifediApiFeature get getPublicTimelineReplyVisibilityFilterFeature;

  IUnifediApiFeature get getPublicTimelineOnlyFromInstanceFeature;

  IUnifediApiFeature get getHashtagTimelineFeature;

  IUnifediApiFeature get getHashtagTimelineOnlyMediaFeature;

  IUnifediApiFeature get getHashtagTimelinePaginationMinIdFeature;

  IUnifediApiFeature get getHashtagTimelineWithMutedFeature;

  IUnifediApiFeature get getHashtagTimelineExcludeVisibilitiesFeature;

  // ignore: long-parameter-list
  Future<List<IUnifediApiStatus>> getPublicTimeline({
    required IUnifediApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? onlyRemote,
    required bool? withMuted,
    required String? onlyFromInstance,
    required List<UnifediApiVisibility>? excludeVisibilities,
    required UnifediApiReplyVisibilityFilter? replyVisibilityFilter,
  });

  Future<List<IUnifediApiStatus>> getHashtagTimeline({
    required String hashtag,
    required IUnifediApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
  });

  IUnifediApiFeature get getHomeTimelineFeature;

  IUnifediApiFeature get getHomeTimelinePaginationMinIdFeature;

  IUnifediApiFeature get getHomeTimelineWithMutedFeature;

  IUnifediApiFeature get getHomeTimelineExcludeVisibilitiesFeature;

  IUnifediApiFeature get getHomeTimelineReplyVisibilityFilterFeature;

  IUnifediApiFeature get getListTimelineFeature;

  IUnifediApiFeature get getListTimelinePaginationMinIdFeature;

  IUnifediApiFeature get getListTimelineWithMutedFeature;

  IUnifediApiFeature get getListTimelineExcludeVisibilitiesFeature;

  IUnifediApiFeature get getListTimelineOnlyLocalFilterFeature;

  Future<List<IUnifediApiStatus>> getHomeTimeline({
    required IUnifediApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
    required UnifediApiReplyVisibilityFilter? replyVisibilityFilter,
  });

  Future<List<IUnifediApiStatus>> getListTimeline({
    required String listId,
    required IUnifediApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
  });
}
