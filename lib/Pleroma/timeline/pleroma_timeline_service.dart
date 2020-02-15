import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/Pleroma/Models/Status.dart' as pleroma;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaTimelineService {

  static IPleromaTimelineService of(BuildContext context,
      {listen: true}) =>
      Provider.of<IPleromaTimelineService>(context, listen: listen);


  Future<List<Status>> getPublicTimeline({
    // Return results older than id
    String maxId,
    // Return results newer than id
    String sinceId,
    // Return results immediately newer than id
    String minId,
    // Maximum number of results to return
    int limit = 20,
    // Show only local statuses?
    bool onlyMedia = false,
    // Show only statuses with media attached?
    bool onlyLocal = false,
    // also return activities by muted (not by blocked!) users
    bool withMuted = false,
    // queries will exclude the statuses with the given visibilities
    List<pleroma.Visibility> excludeVisibilities = const [pleroma.Visibility
        .DIRECT],

  });


  Future<List<Status>> getHashTagTimeline({
    // for example '#cats'
    @required String hashTag,
    // Return results older than id
    String maxId,
    // Return results newer than id
    String sinceId,
    // Return results immediately newer than id
    String minId,
    // Maximum number of results to return
    int limit = 20,
    // Show only local statuses?
    bool onlyMedia = false,
    // Show only statuses with media attached?
    bool onlyLocal = false,
    // also return activities by muted (not by blocked!) users
    bool withMuted = false,
    // queries will exclude the statuses with the given visibilities
    List<pleroma.Visibility> excludeVisibilities = const [pleroma.Visibility
        .DIRECT],});

  Future<List<Status>> getHomeTimeline({
    // Return results older than id
    String maxId,
    // Return results newer than id
    String sinceId,
    // Return results immediately newer than id
    String minId,
    // Maximum number of results to return
    int limit = 20,
    // Show only local statuses?
    bool onlyMedia = false,
    // also return activities by muted (not by blocked!) users
    bool withMuted = false,
    // queries will exclude the statuses with the given visibilities
    List<pleroma.Visibility> excludeVisibilities = const [pleroma.Visibility
        .DIRECT],
  });


  Future<List<Status>> getListTimeline({
    // list id
    @required String listId,
    // Return results older than id
    String maxId,
    // Return results newer than id
    String sinceId,
    // Return results immediately newer than id
    String minId,
    // Maximum number of results to return
    int limit = 20,
    // also return activities by muted (not by blocked!) users
    bool withMuted = false,
    // queries will exclude the statuses with the given visibilities
    List<pleroma.Visibility> excludeVisibilities = const [pleroma.Visibility
        .DIRECT],});

}
