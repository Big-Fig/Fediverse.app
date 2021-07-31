import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/timeline/pleroma_api_timeline_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/visibility/pleroma_api_visibility_model.dart';

abstract class IPleromaApiTimelineService implements IPleromaApi {
  Uri get baseUrl;

  Future<List<IPleromaApiStatus>> getPublicTimeline({
    IPleromaApiPaginationRequest? pagination,
    bool? onlyWithMedia = false,
    bool onlyLocal = false,
    bool onlyRemote = false,
    bool withMuted = false,
    String? onlyFromInstance,
    List<PleromaApiVisibility>? excludeVisibilities = const [
      PleromaApiVisibility.direct,
    ],
    PleromaApiReplyVisibilityFilter? pleromaReplyVisibilityFilter,
  });

  Future<List<IPleromaApiStatus>> getHashtagTimeline({
    required String hashtag,
    IPleromaApiPaginationRequest? pagination,
    bool? onlyWithMedia = false,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaApiVisibility>? excludeVisibilities = const [
      PleromaApiVisibility.direct,
    ],
  });
}
