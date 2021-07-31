import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/timeline/pleroma_api_timeline_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/timeline/pleroma_api_timeline_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/visibility/pleroma_api_visibility_model.dart';

abstract class IPleromaApiAuthTimelineService
    implements IPleromaApiTimelineService {
  Future<List<IPleromaApiStatus>> getHomeTimeline({
    IPleromaApiPaginationRequest? pagination,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaApiVisibility>? excludeVisibilities = const [
      PleromaApiVisibility.direct,
    ],
    PleromaApiReplyVisibilityFilter? pleromaReplyVisibilityFilter,
  });

  Future<List<IPleromaApiStatus>> getListTimeline({
    required String listId,
    IPleromaApiPaginationRequest? pagination,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaApiVisibility>? excludeVisibilities = const [
      PleromaApiVisibility.direct,
    ],
  });
}
