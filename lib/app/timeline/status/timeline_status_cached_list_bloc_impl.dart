import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
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
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

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

  Timeline get timeline => timelineLocalPreferencesBloc.value;

  TimelineType get timelineType => timeline.type;

  List<IFilter> filters;

  List<StatusTextCondition> get excludeTextConditions => filters
      .map(
        (filter) => filter.toStatusTextCondition(),
      )
      .toList();

  @override
  Stream<bool> get settingsChangedStream => timelineLocalPreferencesBloc.stream
          .map((timeline) => timeline?.settings)
          .distinct()
          .map((_) {
        return true;
      }).distinct();

  TimelineStatusCachedListBloc({
    @required this.pleromaAccountService,
    @required this.pleromaTimelineService,
    @required this.statusRepository,
    @required this.filterRepository,
    @required this.currentInstanceBloc,
    @required this.timelineLocalPreferencesBloc,
    @required this.webSocketsHandlerManagerBloc,
    @required WebSocketsListenType webSocketsListenType,
  }) {
    resubscribeWebSocketsUpdates(webSocketsListenType);

    addDisposable(custom: () {
      webSocketsListenerDisposable?.dispose();
    });
  }

  IDisposable webSocketsListenerDisposable;

  void resubscribeWebSocketsUpdates(WebSocketsListenType webSocketsListenType) {
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
            local: timeline.onlyLocal,
            onlyMedia: timeline.onlyWithMedia,
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
            listId: timeline.onlyInRemoteList.id,
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
            accountId: timeline.onlyFromRemoteAccount.id,
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
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t _timeline = $timeline"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    List<IPleromaStatus> remoteStatuses;
    var onlyLocal = timeline.onlyLocal == true;
    var withMuted = timeline.withMuted == true;
    var onlyWithMedia = timeline.onlyWithMedia;
    var excludeVisibilities = timeline.excludeVisibilities;
    var pleromaReplyVisibilityFilter = timeline.replyVisibilityFilter;
    var maxId = olderThan?.remoteId;
    var sinceId = newerThan?.remoteId;
    switch (timelineType) {
      case TimelineType.public:
        remoteStatuses = await pleromaTimelineService.getPublicTimeline(
          maxId: maxId,
          sinceId: sinceId,
          limit: limit,
          onlyLocal: onlyLocal,
          onlyWithMedia: onlyWithMedia,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
          pleromaReplyVisibilityFilter: pleromaReplyVisibilityFilter,
        );
        break;
      case TimelineType.customList:
        remoteStatuses = await pleromaTimelineService.getListTimeline(
          listId: timeline.onlyInRemoteList.id,
          maxId: maxId,
          sinceId: sinceId,
          limit: limit,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
        );
        break;
      case TimelineType.home:
        remoteStatuses = await pleromaTimelineService.getHomeTimeline(
          maxId: maxId,
          sinceId: sinceId,
          limit: limit,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
          pleromaReplyVisibilityFilter: pleromaReplyVisibilityFilter,
        );
        break;
      case TimelineType.hashtag:
        remoteStatuses = await pleromaTimelineService.getHashtagTimeline(
          hashtag: timeline.withRemoteHashtag,
          maxId: maxId,
          sinceId: sinceId,
          limit: limit,
          onlyLocal: onlyLocal,
          onlyWithMedia: onlyWithMedia,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
        );
        break;
      case TimelineType.account:
        remoteStatuses = await pleromaAccountService.getAccountStatuses(
          accountRemoteId: timeline.onlyFromRemoteAccount.id,
          onlyWithMedia: onlyWithMedia,
        );
        break;
    }

    if (remoteStatuses != null) {
      await statusRepository.upsertRemoteStatuses(remoteStatuses,
          listRemoteId: timeline.onlyInRemoteList?.id,
          conversationRemoteId: null,
          isFromHomeTimeline: isFromHomeTimeline);

      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "statuses is null");
      return false;
    }
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item) {
    _logger.finest(() => "watchLocalItemsNewerThanItem \n"
        "\t item=$item");

    var onlyLocalCondition;
    if (timeline.onlyLocal == true) {
      var localUrlHost = currentInstanceBloc.currentInstance.urlHost;
      onlyLocalCondition = StatusOnlyLocalCondition(localUrlHost);
    }
    return statusRepository.watchStatuses(
      onlyInConversation: null,
      onlyFromAccount: timeline.onlyFromRemoteAccount != null
          ? mapRemoteAccountToLocalAccount(timeline.onlyFromRemoteAccount)
          : null,
      onlyInListWithRemoteId: timeline.onlyInRemoteList?.id,
      onlyWithHashtag: timeline.withRemoteHashtag,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocalCondition: onlyLocalCondition,
      onlyWithMedia: timeline.onlyWithMedia,
      withMuted: timeline.withMuted,
      excludeVisibilities: timeline.excludeVisibilities,
      olderThanStatus: null,
      newerThanStatus: item,
      onlyNoNsfwSensitive: timeline.excludeNsfwSensitive,
      onlyNoReplies: timeline.excludeReplies,
      limit: null,
      offset: null,
      orderingTermData: StatusRepositoryOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderType: StatusRepositoryOrderType.remoteId),
      isFromHomeTimeline: isFromHomeTimeline,
      onlyBookmarked: null,
      onlyFavourited: null,
      excludeTextConditions: excludeTextConditions,
    );
  }

  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var onlyLocalCondition;
    if (timeline.onlyLocal == true) {
      var localUrlHost = currentInstanceBloc.currentInstance.urlHost;
      onlyLocalCondition = StatusOnlyLocalCondition(localUrlHost);
    }
    var statuses = await statusRepository.getStatuses(
      onlyInConversation: null,
      onlyFromAccount: timeline.onlyFromRemoteAccount != null
          ? mapRemoteAccountToLocalAccount(timeline.onlyFromRemoteAccount)
          : null,
      onlyInListWithRemoteId: timeline.onlyInRemoteList?.id,
      onlyWithHashtag: timeline.withRemoteHashtag,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocalCondition: onlyLocalCondition,
      onlyWithMedia: timeline.onlyWithMedia,
      withMuted: timeline.withMuted,
      excludeVisibilities: timeline.excludeVisibilities,
      olderThanStatus: olderThan,
      newerThanStatus: newerThan,
      onlyNoNsfwSensitive: timeline.excludeNsfwSensitive,
      onlyNoReplies: timeline.excludeReplies,
      limit: limit,
      offset: null,
      orderingTermData: StatusRepositoryOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderType: StatusRepositoryOrderType.remoteId),
      isFromHomeTimeline: isFromHomeTimeline,
      onlyBookmarked: null,
      onlyFavourited: null,
      excludeTextConditions: excludeTextConditions,
    );

    _logger.finer(() =>
        "finish loadLocalItems for $timeline statuses ${statuses.length}");
    return statuses;
  }

  static TimelineStatusCachedListBloc createFromContext(
    BuildContext context, {
    @required TimelineType timelineType,
    @required ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc,
    @required WebSocketsListenType webSocketsListenType,
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
      );

  @override
  Future internalAsyncInit() async {
    List<MastodonFilterContextType> onlyWithContextTypes;

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
    _logger.finest(() =>
    "filterRepository countAll ${countAll}");

    filters = await filterRepository.getFilters(
      olderThanFilter: null,
      newerThanFilter: null,
      limit: null,
      offset: null,
      orderingTermData: null,
      onlyWithContextTypes: onlyWithContextTypes,
    );

    _logger.finest(() =>
        "timelineType $timelineType, "
            "onlyWithContextTypes $onlyWithContextTypes,"
            " filters $filters");
  }
}
