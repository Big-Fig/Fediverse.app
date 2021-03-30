import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_exception.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:path/path.dart';

class PleromaTimelineService extends DisposableOwner
    implements IPleromaTimelineService {
  @override
  Uri get baseUrl => restService.baseUri;

  final timelineRelativeUrlPath = "/api/v1/timelines/";
  @override
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaTimelineService({required this.restService});

  @override
  Future<List<IPleromaStatus>> getHashtagTimeline({
    required String? hashtag,
    IPleromaPaginationRequest? pagination,
    bool? onlyWithMedia = false,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility>? excludeVisibilities = const [
      PleromaVisibility.direct,
    ],
  }) {
    assert(hashtag != null);
    return getTimeline(
      relativeTimeLineUrlPath: "tag/$hashtag",
      pagination: pagination,
      onlyWithMedia: onlyWithMedia,
      onlyLocal: onlyLocal,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      pleromaReplyVisibilityFilter: null,
      onlyFromInstance: null,
      onlyRemote: null,
    );
  }

  @override
  Future<List<IPleromaStatus>> getHomeTimeline({
    IPleromaPaginationRequest? pagination,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility>? excludeVisibilities = const [
      PleromaVisibility.direct,
    ],
    PleromaReplyVisibilityFilter? pleromaReplyVisibilityFilter,
  }) {
    return getTimeline(
      relativeTimeLineUrlPath: "home",
      pagination: pagination,
      onlyWithMedia: false,
      onlyLocal: onlyLocal,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      pleromaReplyVisibilityFilter: pleromaReplyVisibilityFilter,
      onlyFromInstance: null,
      onlyRemote: null,
    );
  }

  @override
  Future<List<IPleromaStatus>> getListTimeline({
    required String? listId,
    IPleromaPaginationRequest? pagination,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaVisibility>? excludeVisibilities = const [
      PleromaVisibility.direct,
    ],
  }) {
    assert(listId != null);
    return getTimeline(
      relativeTimeLineUrlPath: "list/$listId",
      pagination: pagination,
      onlyWithMedia: null,
      onlyLocal: onlyLocal,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      pleromaReplyVisibilityFilter: null,
      onlyFromInstance: null,
      onlyRemote: null,
    );
  }

  @override
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
  }) {
    return getTimeline(
      relativeTimeLineUrlPath: "public",
      pagination: pagination,
      onlyWithMedia: onlyWithMedia,
      onlyLocal: onlyLocal,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      pleromaReplyVisibilityFilter: pleromaReplyVisibilityFilter,
      onlyFromInstance: onlyFromInstance,
      onlyRemote: onlyRemote,
    );
  }

  Future<List<IPleromaStatus>> getTimeline({
    required String relativeTimeLineUrlPath,
    required IPleromaPaginationRequest? pagination,
    required bool? onlyWithMedia,
    required bool onlyLocal,
    required bool withMuted,
    required bool? onlyRemote,
    required List<PleromaVisibility>? excludeVisibilities,
    required PleromaReplyVisibilityFilter? pleromaReplyVisibilityFilter,
    required String? onlyFromInstance,
  }) async {
    var request = RestRequest.get(
      relativePath: join("/api/v1/timelines/", relativeTimeLineUrlPath),
      queryArgs: [
        ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        if (onlyLocal == true) RestRequestQueryArg("local", "true"),
        if (onlyRemote == true) RestRequestQueryArg("remote", "true"),
        if (onlyWithMedia != null)
          RestRequestQueryArg("only_media", onlyWithMedia.toString()),
        if (onlyFromInstance != null)
          RestRequestQueryArg("instance", onlyFromInstance),
        if (pleromaReplyVisibilityFilter != null)
          RestRequestQueryArg(
            "reply_visibility",
            pleromaReplyVisibilityFilter.toJsonValue(),
          ),
        // array
        ...(excludeVisibilities?.map((visibility) {
              return RestRequestQueryArg(
                "exclude_visibilities[]",
                visibility.toJsonValue(),
              );
            }) ??
            []),
      ],
    );
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<List<IPleromaStatus>> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaStatus.listFromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaTimelineException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
