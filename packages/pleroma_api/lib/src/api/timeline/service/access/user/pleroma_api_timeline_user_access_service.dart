import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../status/pleroma_api_status_model.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../../visibility/reply_filter/pleroma_api_timeline_reply_visibility_filter_model.dart';
import '../public/pleroma_api_timeline_public_access_service.dart';

abstract class IPleromaApiTimelineUserAccessService
    implements IPleromaApiTimelinePublicAccessService {
  IPleromaApiFeature get getHomeTimelineFeature;
  IPleromaApiFeature get getHomeTimelinePaginationMinIdFeature;
  IPleromaApiFeature get getListTimelineFeature;
  IPleromaApiFeature get getListTimelinePaginationMinIdFeature;

  Future<List<IPleromaApiStatus>> getHomeTimeline({
    required IPleromaApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<PleromaApiVisibility>? excludeVisibilities,
    required PleromaApiReplyVisibilityFilter? replyVisibilityFilter,
  });

  Future<List<IPleromaApiStatus>> getListTimeline({
    required String listId,
    required IPleromaApiPagination? pagination,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<PleromaApiVisibility>? excludeVisibilities,
  });
}
