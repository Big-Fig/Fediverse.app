import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_exception.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class PleromaTimelineService implements IPleromaTimelineService {
  @override
  Uri get baseUrl => restService.baseUrl;

  final timelineRelativeUrlPath = "/api/v1/timelines/";
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaStateStream =>
      restService.pleromaStateStream;

  @override
  PleromaApiState get pleromaState => restService.pleromaState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaTimelineService({@required this.restService});

  @override
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
      PleromaVisibility.DIRECT
    ],
  }) {
    assert(hashtag != null);
    return getTimeline(
        relativeTimeLineUrlPath: "tag/$hashtag",
        maxId: maxId,
        sinceId: sinceId,
        minId: minId,
        limit: limit,
        onlyWithMedia: onlyWithMedia,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities);
  }

  @override
  Future<List<IPleromaStatus>> getHomeTimeline({
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
    bool onlyWithMedia = false,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.DIRECT
    ],
  }) {
    return getTimeline(
        relativeTimeLineUrlPath: "home",
        maxId: maxId,
        sinceId: sinceId,
        minId: minId,
        limit: limit,
        onlyWithMedia: onlyWithMedia,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities);
  }

  @override
  Future<List<IPleromaStatus>> getListTimeline({
    @required String listId,
    String maxId,
      String sinceId,
     String minId,
    bool onlyWithMedia = false,
    bool onlyLocal = false,
    int limit = 20,
    bool withMuted = false,
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.DIRECT
    ],
  }) {
    assert(listId != null);
    return getTimeline(
        relativeTimeLineUrlPath: "list/$listId",
        maxId: maxId,
        sinceId: sinceId,
        minId: minId,
        limit: limit,
        onlyWithMedia: onlyWithMedia,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities);
  }

  @override
  Future<List<IPleromaStatus>> getPublicTimeline({
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
    bool onlyWithMedia = false,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility> excludeVisibilities = const [
      PleromaVisibility.DIRECT
    ],
  }) {
    return getTimeline(
        relativeTimeLineUrlPath: "public",
        maxId: maxId,
        sinceId: sinceId,
        minId: minId,
        limit: limit,
        onlyWithMedia: onlyWithMedia,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilities: excludeVisibilities);
  }

  Future<List<IPleromaStatus>> getTimeline(
      {@required String relativeTimeLineUrlPath,
      @required String maxId,
      @required String sinceId,
      @required String minId,
      @required int limit,
      @required bool onlyWithMedia,
      @required bool onlyLocal,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities}) async {
    var request = RestRequest.get(
        relativePath: join("/api/v1/timelines/", relativeTimeLineUrlPath),
        queryArgs: [
          RestRequestQueryArg("min_id", minId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("limit", limit.toString()),
          RestRequestQueryArg("local", onlyLocal.toString()),
          RestRequestQueryArg("only_media", onlyWithMedia.toString()),
          RestRequestQueryArg("with_muted", withMuted.toString()),
          // array
          ...(excludeVisibilities?.map((visibility) {
            return RestRequestQueryArg("exclude_visibilities[]",
                pleromaVisibilityValues.reverse[visibility]);
          }))
        ]);
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<List<IPleromaStatus>> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaStatus.listFromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaTimelineException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  void dispose() {
    // nothing
  }
}
