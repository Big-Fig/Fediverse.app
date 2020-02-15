import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/Pleroma/Models/Status.dart' as pleroma;
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_exception.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class PleromaTimelineService implements IPleromaTimelineService {
  final timelineRelativeUrlPath = "/api/v1/timelines/";
  final IPleromaRestService restService;

  PleromaTimelineService({@required this.restService});

  @override
  Future<List<Status>> getHashTagTimeline({
    // for example '#cats'
    @required String hashTag, // Return results older than id
    String maxId, // Return results newer than id
    String sinceId, // Return results immediately newer than id
    String minId, // Maximum number of results to return
    int limit = 20, // Show only local statuses?
    bool onlyMedia = false, // Show only statuses with media attached?
    bool onlyLocal =
        false, // also return activities by muted (not by blocked!) users
    bool withMuted =
        false, // queries will exclude the statuses with the given visibilities
    List<pleroma.Visibility> excludeVisibilities = const [
      pleroma.Visibility.DIRECT
    ],
  }) {
    assert(hashTag != null);
    return getTimeline(
        relativeTimeLineUrlPath: "tag/$hashTag",
        maxId: maxId,
        sinceId: sinceId,
        minId: minId,
        limit: limit,
        onlyMedia: onlyMedia,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities);
  }

  @override
  Future<List<Status>> getHomeTimeline({
    // Return results older than id
    String maxId, // Return results newer than id
    String sinceId, // Return results immediately newer than id
    String minId, // Maximum number of results to return
    int limit = 20, // Show only local statuses?
    bool onlyMedia =
        false, // also return activities by muted (not by blocked!) users
    bool withMuted =
        false, // queries will exclude the statuses with the given visibilities
    List<pleroma.Visibility> excludeVisibilities = const [
      pleroma.Visibility.DIRECT
    ],
  }) {
    return getTimeline(
        relativeTimeLineUrlPath: "home",
        maxId: maxId,
        sinceId: sinceId,
        minId: minId,
        limit: limit,
        onlyMedia: onlyMedia,
        onlyLocal: null,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities);
  }

  @override
  Future<List<Status>> getListTimeline({
    // list id
    @required String listId, // Return results older than id
    String maxId, // Return results newer than id
    String sinceId, // Return results immediately newer than id
    String minId, // Maximum number of results to return
    int limit = 20, // also return activities by muted (not by blocked!) users
    bool withMuted =
        false, // queries will exclude the statuses with the given visibilities
    List<pleroma.Visibility> excludeVisibilities = const [
      pleroma.Visibility.DIRECT
    ],
  }) {
    assert(listId != null);
    return getTimeline(
        relativeTimeLineUrlPath: "list/$listId",
        maxId: maxId,
        sinceId: sinceId,
        minId: minId,
        limit: limit,
        onlyMedia: null,
        onlyLocal: null,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities);
  }

  @override
  Future<List<Status>> getPublicTimeline({
    // Return results older than id
    String maxId, // Return results newer than id
    String sinceId, // Return results immediately newer than id
    String minId, // Maximum number of results to return
    int limit = 20, // Show only local statuses?
    bool onlyMedia = false, // Show only statuses with media attached?
    bool onlyLocal =
        false, // also return activities by muted (not by blocked!) users
    bool withMuted =
        false, // queries will exclude the statuses with the given visibilities
    List<pleroma.Visibility> excludeVisibilities = const [
      pleroma.Visibility.DIRECT
    ],
  }) {
    return getTimeline(
        relativeTimeLineUrlPath: "public",
        maxId: maxId,
        sinceId: sinceId,
        minId: minId,
        limit: limit,
        onlyMedia: onlyMedia,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities);
  }

  Future<List<Status>> getTimeline(
      {@required String relativeTimeLineUrlPath,
      @required String maxId,
      @required String sinceId,
      @required String minId,
      @required int limit,
      @required bool onlyMedia,
      @required bool onlyLocal,
      @required bool withMuted,
      @required List<pleroma.Visibility> excludeVisibilities}) async {
    // we should duplicate exclude_visibilities[] keys for each value
    String additionalQueryArgsString = excludeVisibilities
        ?.map((visibility) => "exclude_visibilities[]="
            "${visibilityValues.reverse[visibility]}")
        ?.join("&");

    var request = RestRequest.get(
        relativePath: join("/api/v1/timelines/", relativeTimeLineUrlPath),
        queryArgs: {
          "min_id": minId,
          "max_id": maxId,
          "since_id": sinceId,
          "limit": limit.toString(),
          "local": onlyLocal.toString(),
          "only_media": onlyMedia.toString(),
          "with_muted": withMuted.toString(),
        },
        additionalQueryArgsString: additionalQueryArgsString);
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<List<Status>> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => Status.listFromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw new PleromaTimelineException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }
}
