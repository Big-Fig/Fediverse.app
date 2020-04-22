import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaTimelineService implements IPleromaApi {
  Uri get baseUrl;

  static IPleromaTimelineService of(BuildContext context, {listen: true}) =>
      Provider.of<IPleromaTimelineService>(context, listen: listen);

  Future<List<IPleromaStatus>> getPublicTimeline({
    /// Return results older than id
    String maxId,
    /// Return results newer than id
    String sinceId,
    /// Return results immediately newer than id
    String minId,
    /// Maximum number of results to return
    int limit = 20,
    /// Show only statuses with media attached?
    bool onlyWithMedia = false,
    /// Show only local statuses?
    bool onlyLocal =
        false,
    /// also return activities by muted (not by blocked!) users
    bool withMuted =
        false,
    /// queries will exclude the statuses with the given visibilities
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.DIRECT
    ],
  });

  Future<List<IPleromaStatus>> getHashtagTimeline({
    /// for example '#cats'
    @required String hashtag, /// Return results older than id
    String maxId,
    /// Return results newer than id
    String sinceId,
    /// Return results immediately newer than id
    String minId,
    /// Maximum number of results to return
    int limit = 20,
    /// Show only local statuses?
    bool onlyWithMedia = false,
    /// Show only statuses with media attached?
    bool onlyLocal =
        false,
    /// also return activities by muted (not by blocked!) users
    bool withMuted =
        false,
    /// queries will exclude the statuses with the given visibilities
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.DIRECT
    ],
  });

  Future<List<IPleromaStatus>> getHomeTimeline({
    /// Return results older than id
    String maxId,
    /// Return results newer than id
    String sinceId,
    /// Return results immediately newer than id
    String minId,
    /// Maximum number of results to return
    int limit = 20,
    /// Show only statuses with media attached?
    bool onlyWithMedia = false,
    /// Show only local statuses?
    bool onlyLocal =
        false,
    /// also return activities by muted (not by blocked!) users
    bool withMuted =
        false,
    /// queries will exclude the statuses with the given visibilities
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.DIRECT
    ],
  });

  Future<List<IPleromaStatus>> getListTimeline({
    /// list id
    @required String listId,
    /// Return results older than id
    String maxId,
    /// Return results newer than id
    String sinceId,
    /// Return results immediately newer than id
    String minId,
    /// Maximum number of results to return
    int limit = 20,
    /// Show only statuses with media attached?
    bool onlyWithMedia = false,
    /// Show only local statuses?
    bool onlyLocal =
        false,
    /// also return activities by muted (not by blocked!) users
    bool withMuted =
        false,
    /// queries will exclude the statuses with the given visibilities
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.DIRECT
    ],
  });
}
