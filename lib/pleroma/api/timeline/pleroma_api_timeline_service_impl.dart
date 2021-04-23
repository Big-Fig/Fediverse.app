import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_exception.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_model.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_service.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:path/path.dart';

class PleromaApiTimelineService extends DisposableOwner
    implements IPleromaApiTimelineService {
  @override
  Uri get baseUrl => restService.baseUri;

  final timelineRelativeUrlPath = "/api/v1/timelines/";
  @override
  final IPleromaApiAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiTimelineService({required this.restService});

  @override
  Future<List<IPleromaApiStatus>> getHashtagTimeline({
    required String? hashtag,
    IPleromaApiPaginationRequest? pagination,
    bool? onlyWithMedia = false,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaApiVisibility>? excludeVisibilities = const [
      PleromaApiVisibility.direct,
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
  Future<List<IPleromaApiStatus>> getHomeTimeline({
    IPleromaApiPaginationRequest? pagination,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaApiVisibility>? excludeVisibilities = const [
      PleromaApiVisibility.direct,
    ],
    PleromaApiReplyVisibilityFilter? pleromaReplyVisibilityFilter,
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
  Future<List<IPleromaApiStatus>> getListTimeline({
    required String? listId,
    IPleromaApiPaginationRequest? pagination,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaApiVisibility>? excludeVisibilities = const [
      PleromaApiVisibility.direct,
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
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
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
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  Future<List<IPleromaApiStatus>> getTimeline({
    required String relativeTimeLineUrlPath,
    required IPleromaApiPaginationRequest? pagination,
    required bool? onlyWithMedia,
    required bool onlyLocal,
    required bool withMuted,
    required bool? onlyRemote,
    required List<PleromaApiVisibility>? excludeVisibilities,
    required PleromaApiReplyVisibilityFilter? pleromaReplyVisibilityFilter,
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

    RestResponse<List<IPleromaApiStatus>> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaApiStatus.listFromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiTimelineException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
