import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaTimelineService implements IPleromaApi {
  Uri get baseUrl;

  static IPleromaTimelineService of(BuildContext context, {listen = true}) =>
      Provider.of<IPleromaTimelineService>(context, listen: listen);

  Future<List<IPleromaStatus>> getPublicTimeline({
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
    bool onlyWithMedia = false,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.direct
    ],
    PleromaReplyVisibilityFilter pleromaReplyVisibilityFilter,
  });

  Future<List<IPleromaStatus>> getHashtagTimeline({
    @required String hashtag,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
    bool onlyWithMedia = false,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.direct
    ],
  });

  Future<List<IPleromaStatus>> getHomeTimeline({
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.direct
    ],
    PleromaReplyVisibilityFilter pleromaReplyVisibilityFilter,
  });

  Future<List<IPleromaStatus>> getListTimeline({
    @required String listId,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.direct
    ],
  });
}
