import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/timeline/auth/pleroma_api_auth_timeline_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/timeline/pleroma_api_timeline_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/timeline/pleroma_api_timeline_service_impl.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';

class PleromaApiAuthTimelineService extends PleromaApiTimelineService
    with PleromaApiAuthMixinService
    implements IPleromaApiAuthTimelineService {
  final IPleromaApiAuthRestService authRestService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => authRestService;

  PleromaApiAuthTimelineService({
    required this.authRestService,
  }) : super(
          restService: authRestService,
        );

  @override
  Future<List<IPleromaApiStatus>> getListTimeline({
    required String listId,
    IPleromaApiPaginationRequest? pagination,
    bool onlyLocal = false,
    bool withMuted = false,
    List<PleromaApiVisibility>? excludeVisibilities = const [
      PleromaApiVisibility.direct,
    ],
  }) {
    assert(listId.isNotEmpty);

    return getTimeline(
      relativeTimeLineUrlPath: 'list/$listId',
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
      relativeTimeLineUrlPath: 'public',
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
      relativeTimeLineUrlPath: 'home',
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
  Future<List<IPleromaApiStatus>> sendAndProcessPleromaApiStatusResponse(
    RestRequest<dynamic> request,
  ) async {
    var httpResponse = await authRestService.sendHttpRequest(request);

    return authRestService.processJsonListResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }
}
