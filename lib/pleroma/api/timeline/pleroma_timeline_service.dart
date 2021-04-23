import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaTimelineService implements IPleromaApi {
  Uri get baseUrl;

  static IPleromaTimelineService of(BuildContext context, {listen = true}) =>
      Provider.of<IPleromaTimelineService>(context, listen: listen);

  Future<List<IPleromaStatus>> getPublicTimeline({
    IPleromaPaginationRequest? pagination,
    bool? onlyWithMedia = false,
    bool onlyLocal = false,
    bool onlyRemote = false,
    bool withMuted = false,
    String? onlyFromInstance,
    List<PleromaVisibility>? excludeVisibilities = const [
      PleromaVisibility.direct,
    ],
    PleromaReplyVisibilityFilter? pleromaReplyVisibilityFilter,
  });

  Future<List<IPleromaStatus>> getHashtagTimeline({
    required String? hashtag,
    IPleromaPaginationRequest? pagination,
    bool? onlyWithMedia = false,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility>? excludeVisibilities = const [
      PleromaVisibility.direct,
    ],
  });

  Future<List<IPleromaStatus>> getHomeTimeline({
    IPleromaPaginationRequest? pagination,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility>? excludeVisibilities = const [
      PleromaVisibility.direct,
    ],
    PleromaReplyVisibilityFilter? pleromaReplyVisibilityFilter,
  });

  Future<List<IPleromaStatus>> getListTimeline({
    required String? listId,
    IPleromaPaginationRequest? pagination,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility>? excludeVisibilities = const [
      PleromaVisibility.direct,
    ],
  });
}
