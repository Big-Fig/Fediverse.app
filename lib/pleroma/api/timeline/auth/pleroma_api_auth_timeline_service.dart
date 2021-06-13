import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_model.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_service.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiAuthTimelineService
    implements IPleromaApiTimelineService {
  static IPleromaApiAuthTimelineService of(
    BuildContext context, {
    listen = true,
  }) =>
      Provider.of<IPleromaApiAuthTimelineService>(context, listen: listen);

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
