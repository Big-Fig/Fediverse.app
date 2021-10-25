import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../../status/pleroma_api_status_model.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../../visibility/reply_filter/pleroma_api_timeline_reply_visibility_filter_model.dart';

abstract class IPleromaApiTimelinePublicAccessService
    implements IPleromaApiService {
  List<PleromaApiVisibility> calculatePossibleExcludeVisibilitiesValues();

  IPleromaApiFeature get getPublicTimelineFeature;

  IPleromaApiFeature get getPublicTimelineOnlyMediaFeature;

  IPleromaApiFeature get getPublicTimelinePaginationMinIdFeature;

  IPleromaApiFeature get getPublicTimelineOnlyRemoteFeature;

  IPleromaApiFeature get getHashtagTimelineFeature;

  IPleromaApiFeature get getHashtagTimelineOnlyMediaFeature;

  IPleromaApiFeature get getHashtagTimelinePaginationMinIdFeature;

  // ignore: long-parameter-list
  Future<List<IPleromaApiStatus>> getPublicTimeline({
    required IPleromaApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? onlyRemote,
    required bool? withMuted,
    required String? onlyFromInstance,
    required List<PleromaApiVisibility>? excludeVisibilities,
    required PleromaApiReplyVisibilityFilter? replyVisibilityFilter,
  });

  Future<List<IPleromaApiStatus>> getHashtagTimeline({
    required String hashtag,
    required IPleromaApiPagination? pagination,
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<PleromaApiVisibility>? excludeVisibilities,
  });
}
