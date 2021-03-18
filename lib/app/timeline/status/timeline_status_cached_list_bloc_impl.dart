import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("timeline_status_cached_list_bloc_impl.dart");

class TimelineStatusCachedListBloc extends AsyncInitLoadingBloc
    implements IStatusCachedListBloc {
  final IPleromaAccountService pleromaAccountService;
  final IPleromaTimelineService pleromaTimelineService;
  final IStatusRepository statusRepository;
  final IFilterRepository filterRepository;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final IMyAccountBloc myAccountBloc;

  Timeline get timeline => timelineLocalPreferencesBloc.value!;

  TimelineType get timelineType => timeline.type;

  late List<IFilter> filters;

  List<StatusTextCondition> get excludeTextConditions => filters
      .map(
        (filter) => filter.toStatusTextCondition(),
      )
      .toList();

  StatusOnlyLocalCondition? get onlyLocalCondition {
    if (timeline.onlyLocal == true) {
      var localUrlHost = currentInstanceBloc.currentInstance!.urlHost;
      return StatusOnlyLocalCondition(localUrlHost);
    } else {
      return null;
    }
  }

  StatusOnlyRemoteCondition? get onlyRemoteCondition {
    if (timeline.onlyRemote == true) {
      var localUrlHost = currentInstanceBloc.currentInstance!.urlHost;
      return StatusOnlyRemoteCondition(localUrlHost);
    } else {
      return null;
    }
  }

  StatusRepositoryFilters get _statusRepositoryFilters =>
      StatusRepositoryFilters(
        onlyInConversation: null,
        onlyFromAccount: timeline.onlyFromRemoteAccount?.toDbAccountWrapper(),
        onlyInListWithRemoteId: timeline.onlyInRemoteList?.id,
        onlyWithHashtag: timeline.withRemoteHashtag,
        onlyLocalCondition: onlyLocalCondition,
        onlyWithMedia: timeline.onlyWithMedia,
        withMuted: timeline.withMuted,
        excludeVisibilities: timeline.excludeVisibilities,
        onlyNoNsfwSensitive: timeline.excludeNsfwSensitive,
        onlyNoReplies: timeline.excludeReplies,
        isFromHomeTimeline: isFromHomeTimeline,
        excludeTextConditions: excludeTextConditions,
        replyVisibilityFilterCondition: timeline.replyVisibilityFilter != null
            ? PleromaReplyVisibilityFilterCondition(
                myAccountRemoteId: myAccountBloc.myAccount!.remoteId,
                replyVisibilityFilter: timeline.replyVisibilityFilter,
              )
            : null,
        onlyFromInstance: timeline.onlyFromInstance,
        onlyRemoteCondition: onlyRemoteCondition,
      );

  @override
  Stream<bool> get settingsChangedStream => timelineLocalPreferencesBloc.stream
      .map((timeline) => timeline?.settings)
      .map((_) => true)
      .distinct();

  TimelineStatusCachedListBloc({
    required this.pleromaAccountService,
    required this.pleromaTimelineService,
    required this.statusRepository,
    required this.filterRepository,
    required this.currentInstanceBloc,
    required this.timelineLocalPreferencesBloc,
    required this.webSocketsHandlerManagerBloc,
    required this.myAccountBloc,
    required WebSocketsListenType webSocketsListenType,
  }) {
    resubscribeWebSocketsUpdates(webSocketsListenType);

    addDisposable(custom: () {
      webSocketsListenerDisposable?.dispose();
    });
  }

  IDisposable? webSocketsListenerDisposable;

  void resubscribeWebSocketsUpdates(
    WebSocketsListenType webSocketsListenType,
  ) {
    webSocketsListenerDisposable?.dispose();

    var isWebSocketsUpdatesEnabled =
        timeline.isWebSocketsUpdatesEnabled ?? true;
    _logger.finest(() => "resubscribeWebSocketsUpdates "
        "isWebSocketsUpdatesEnabled $isWebSocketsUpdatesEnabled "
        "webSocketsListenType $webSocketsListenType "
        "timelineType $timelineType ");
    if (isWebSocketsUpdatesEnabled) {
      switch (timelineType) {
        case TimelineType.public:
          webSocketsListenerDisposable =
              webSocketsHandlerManagerBloc.listenPublicChannel(
            listenType: webSocketsListenType,
            onlyLocal: timeline.onlyLocal,
            onlyMedia: timeline.onlyWithMedia,
            onlyRemote: timeline.onlyRemote,
            onlyFromInstance: timeline.onlyFromInstance,
          );
          break;
        case TimelineType.home:
          webSocketsListenerDisposable =
              webSocketsHandlerManagerBloc.listenMyAccountChannel(
            listenType: webSocketsListenType,
            notification: false,
            chat: false,
          );

          break;
        case TimelineType.customList:
          webSocketsListenerDisposable =
              webSocketsHandlerManagerBloc.listenListChannel(
            listenType: webSocketsListenType,
            listId: timeline.onlyInRemoteList!.id,
          );
          break;

        case TimelineType.hashtag:
          webSocketsListenerDisposable =
              webSocketsHandlerManagerBloc.listenHashtagChannel(
            listenType: webSocketsListenType,
            hashtag: timeline.withRemoteHashtag,
            local: timeline.onlyLocal,
          );
          break;
        case TimelineType.account:
          webSocketsListenerDisposable =
              webSocketsHandlerManagerBloc.listenAccountChannel(
            listenType: webSocketsListenType,
            accountId: timeline.onlyFromRemoteAccount!.id,
            notification: false,
          );
          break;
      }
    }
  }

  @override
  IPleromaApi get pleromaApi => pleromaTimelineService;

  bool get isFromHomeTimeline => timelineType == TimelineType.home;

  @override
  Future<bool> refreshItemsFromRemoteForPage({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t _timeline = $timeline"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    List<IPleromaStatus>? remoteStatuses;
    var onlyLocal = timeline.onlyLocal == true;
    var onlyRemote = timeline.onlyRemote == true;
    var onlyFromInstance = timeline.onlyFromInstance;
    var withMuted = timeline.withMuted == true;
    var onlyWithMedia = timeline.onlyWithMedia;
    var excludeVisibilities = timeline.excludeVisibilities;
    var pleromaReplyVisibilityFilter = timeline.replyVisibilityFilter;
    var pagination = PleromaPaginationRequest(
      limit: limit,
      sinceId: newerThan?.remoteId,
      maxId: olderThan?.remoteId,
    );
    switch (timelineType) {
      case TimelineType.public:
        remoteStatuses = await pleromaTimelineService.getPublicTimeline(
          pagination: pagination,
          onlyLocal: onlyLocal,
          onlyRemote: onlyRemote,
          onlyFromInstance: onlyFromInstance,
          onlyWithMedia: onlyWithMedia,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
          pleromaReplyVisibilityFilter: pleromaReplyVisibilityFilter,
        );
        break;
      case TimelineType.customList:
        remoteStatuses = await pleromaTimelineService.getListTimeline(
          listId: timeline.onlyInRemoteList!.id,
          pagination: pagination,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
        );
        break;
      case TimelineType.home:
        remoteStatuses = await pleromaTimelineService.getHomeTimeline(
          pagination: pagination,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
          pleromaReplyVisibilityFilter: pleromaReplyVisibilityFilter,
        );
        break;
      case TimelineType.hashtag:
        remoteStatuses = await pleromaTimelineService.getHashtagTimeline(
          hashtag: timeline.withRemoteHashtag,
          pagination: pagination,
          onlyLocal: onlyLocal,
          onlyWithMedia: onlyWithMedia,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
        );
        break;
      case TimelineType.account:
        remoteStatuses = await pleromaAccountService.getAccountStatuses(
          accountRemoteId: timeline.onlyFromRemoteAccount!.id,
          onlyWithMedia: onlyWithMedia,
        );
        break;
    }

    if (remoteStatuses != null) {
      await statusRepository.upsertRemoteStatuses(
        remoteStatuses,
        listRemoteId: timeline.onlyInRemoteList?.id,
        conversationRemoteId: null,
        isFromHomeTimeline: isFromHomeTimeline,
      );

      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "statuses is null");
      return false;
    }
  }

  @override
  Future<List<IStatus>> loadLocalItems({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    var statuses = await statusRepository.getStatuses(
      filters: _statusRepositoryFilters,
      pagination: RepositoryPagination<IStatus>(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
    );

    return statuses;
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item) {
    return statusRepository.watchStatuses(
      filters: _statusRepositoryFilters,
      pagination: RepositoryPagination<IStatus>(
        newerThanItem: item,
      ),
    );
  }

  static TimelineStatusCachedListBloc createFromContext(
    BuildContext context, {
    required TimelineType timelineType,
    required ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc,
    required WebSocketsListenType webSocketsListenType,
  }) =>
      TimelineStatusCachedListBloc(
        pleromaAccountService: IPleromaAccountService.of(
          context,
          listen: false,
        ),
        pleromaTimelineService: IPleromaTimelineService.of(
          context,
          listen: false,
        ),
        statusRepository: IStatusRepository.of(
          context,
          listen: false,
        ),
        currentInstanceBloc: ICurrentAuthInstanceBloc.of(
          context,
          listen: false,
        ),
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
        webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
          context,
          listen: false,
        ),
        webSocketsListenType: webSocketsListenType,
        filterRepository: IFilterRepository.of(
          context,
          listen: false,
        ),
        myAccountBloc: IMyAccountBloc.of(
          context,
          listen: false,
        ),
      );

  @override
  Future internalAsyncInit() async {
    List<MastodonFilterContextType>? onlyWithContextTypes;

    switch (timelineType) {
      case TimelineType.public:
        onlyWithContextTypes = [
          MastodonFilterContextType.public,
        ];
        break;
      case TimelineType.home:
      case TimelineType.customList:
        onlyWithContextTypes = [
          MastodonFilterContextType.homeAndCustomLists,
        ];
        break;
      case TimelineType.hashtag:
        onlyWithContextTypes = [];
        break;
      case TimelineType.account:
        onlyWithContextTypes = [
          MastodonFilterContextType.account,
        ];
        break;
    }

    var countAll = await filterRepository.countAll();
    _logger.finest(() => "filterRepository countAll ${countAll}");

    filters = await filterRepository.getFilters(
      filters: FilterRepositoryFilters(
        onlyWithContextTypes: onlyWithContextTypes,
        notExpired: true,
      ),
      pagination: null,
    );

    _logger.finest(() => "timelineType $timelineType, "
        "onlyWithContextTypes $onlyWithContextTypes,"
        " filters $filters");
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
