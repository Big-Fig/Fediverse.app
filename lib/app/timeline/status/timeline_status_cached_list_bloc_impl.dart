import 'dart:async';

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
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/timeline/auth/pleroma_api_auth_timeline_service.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger('timeline_status_cached_list_bloc_impl.dart');

class TimelineStatusCachedListBloc extends AsyncInitLoadingBloc
    implements IStatusCachedListBloc {
  final IPleromaApiAccountService pleromaApiAccountService;
  final IPleromaApiAuthTimelineService pleromaApiAuthTimelineService;
  final IStatusRepository statusRepository;
  final IFilterRepository filterRepository;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final ITimelineLocalPreferenceBloc timelineLocalPreferencesBloc;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final IMyAccountBloc myAccountBloc;

  Timeline get timeline => timelineLocalPreferencesBloc.value!;

  TimelineType get timelineType => timeline.type;

  // ignore: avoid-late-keyword
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

  final StreamController settingsChangedStreamController =
      StreamController.broadcast();

  @override
  Stream get settingsChangedStream => settingsChangedStreamController.stream;

  Timeline? currentTimelineData;

  TimelineStatusCachedListBloc({
    required this.pleromaApiAccountService,
    required this.pleromaApiAuthTimelineService,
    required this.statusRepository,
    required this.filterRepository,
    required this.currentInstanceBloc,
    required this.timelineLocalPreferencesBloc,
    required this.webSocketsHandlerManagerBloc,
    required this.myAccountBloc,
    required WebSocketsListenType webSocketsListenType,
  }) {
    addDisposable(streamController: settingsChangedStreamController);

    addDisposable(
      streamSubscription: timelineLocalPreferencesBloc.stream.listen(
        (Timeline? timeline) {
          _logger.finest(
            () => 'timelineLocalPreferencesBloc timeline $timeline',
          );
          if (currentTimelineData != timeline) {
            currentTimelineData = timeline;

            settingsChangedStreamController.add(timeline?.settings);
          }
        },
      ),
    );

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
    _logger.finest(() => 'resubscribeWebSocketsUpdates '
        'isWebSocketsUpdatesEnabled $isWebSocketsUpdatesEnabled '
        'webSocketsListenType $webSocketsListenType '
        'timelineType $timelineType ');
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
            hashtag: timeline.withRemoteHashtag!,
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
  IPleromaApi get pleromaApi => pleromaApiAuthTimelineService;

  bool get isFromHomeTimeline => timelineType == TimelineType.home;

  bool get onlyLocal => timeline.onlyLocal == true;

  bool get onlyRemote => timeline.onlyRemote == true;

  String? get onlyFromInstance => timeline.onlyFromInstance;

  bool get withMuted => timeline.withMuted == true;

  bool get onlyWithMedia => timeline.onlyWithMedia == true;

  List<PleromaApiVisibility>? get excludeVisibilities =>
      timeline.excludeVisibilities;

  PleromaApiReplyVisibilityFilter? get pleromaReplyVisibilityFilter =>
      timeline.replyVisibilityFilter;

  @override
  Future<bool> refreshItemsFromRemoteForPage({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    _logger.fine(() => 'start refreshItemsFromRemoteForPage \n'
        '\t _timeline = $timeline'
        '\t newerThan = $newerThan'
        '\t olderThan = $olderThan');

    List<IPleromaApiStatus>? remoteStatuses;

    var pagination = PleromaApiPaginationRequest(
      limit: limit,
      sinceId: newerThan?.remoteId,
      maxId: olderThan?.remoteId,
    );
    switch (timelineType) {
      case TimelineType.public:
        remoteStatuses = await _loadPublicTimeline(pagination);
        break;
      case TimelineType.customList:
        remoteStatuses = await _loadListTimeline(pagination);
        break;
      case TimelineType.home:
        remoteStatuses = await _loadHomeTimeline(pagination);
        break;
      case TimelineType.hashtag:
        remoteStatuses = await _loadHashtagTimeline(pagination);
        break;
      case TimelineType.account:
        remoteStatuses = await _loadAccountTimeline();
        break;
    }

    if (remoteStatuses.isNotEmpty) {
      await statusRepository.upsertRemoteStatusesWithAllArguments(
        remoteStatuses,
        listRemoteId: timeline.onlyInRemoteList?.id,
        conversationRemoteId: null,
        isFromHomeTimeline: isFromHomeTimeline,
        batchTransaction: null,
      );

      return true;
    } else {
      _logger.severe(() => 'error during refreshItemsFromRemoteForPage: '
          'statuses is null');

      return false;
    }
  }

  Future<List<IPleromaApiStatus>> _loadAccountTimeline() async {
    return await pleromaApiAccountService.getAccountStatuses(
      accountRemoteId: timeline.onlyFromRemoteAccount!.id,
      onlyWithMedia: onlyWithMedia,
    );
  }

  Future<List<IPleromaApiStatus>> _loadHashtagTimeline(
    PleromaApiPaginationRequest pagination,
  ) async {
    return await pleromaApiAuthTimelineService.getHashtagTimeline(
      hashtag: timeline.withRemoteHashtag!,
      pagination: pagination,
      onlyLocal: onlyLocal,
      onlyWithMedia: onlyWithMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
    );
  }

  Future<List<IPleromaApiStatus>> _loadHomeTimeline(
    PleromaApiPaginationRequest pagination,
  ) async {
    return await pleromaApiAuthTimelineService.getHomeTimeline(
      pagination: pagination,
      onlyLocal: onlyLocal,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      pleromaReplyVisibilityFilter: pleromaReplyVisibilityFilter,
    );
  }

  Future<List<IPleromaApiStatus>> _loadListTimeline(
    PleromaApiPaginationRequest pagination,
  ) async {
    return await pleromaApiAuthTimelineService.getListTimeline(
      listId: timeline.onlyInRemoteList!.id,
      pagination: pagination,
      onlyLocal: onlyLocal,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
    );
  }

  Future<List<IPleromaApiStatus>> _loadPublicTimeline(
    PleromaApiPaginationRequest pagination,
  ) async {
    return await pleromaApiAuthTimelineService.getPublicTimeline(
      pagination: pagination,
      onlyLocal: onlyLocal,
      onlyRemote: onlyRemote,
      onlyFromInstance: onlyFromInstance,
      onlyWithMedia: onlyWithMedia,
      withMuted: withMuted,
      excludeVisibilities: excludeVisibilities,
      pleromaReplyVisibilityFilter: pleromaReplyVisibilityFilter,
    );
  }

  @override
  Future<List<IStatus>> loadLocalItems({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    var statuses = await statusRepository.findAllInAppType(
      filters: _statusRepositoryFilters,
      pagination: RepositoryPagination<IStatus>(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTerms: [StatusRepositoryOrderingTermData.remoteIdDesc],
    );

    return statuses;
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus? item) {
    return statusRepository.watchFindAllInAppType(
      filters: _statusRepositoryFilters,
      pagination: RepositoryPagination<IStatus>(
        newerThanItem: item,
      ),
      orderingTerms: [StatusRepositoryOrderingTermData.remoteIdDesc],
    );
  }

  static TimelineStatusCachedListBloc createFromContext(
    BuildContext context, {
    required WebSocketsListenType webSocketsListenType,
    required ITimelineLocalPreferenceBloc timelineLocalPreferencesBloc,
  }) =>
      TimelineStatusCachedListBloc(
        pleromaApiAccountService: IPleromaApiAccountService.of(
          context,
          listen: false,
        ),
        pleromaApiAuthTimelineService: IPleromaApiAuthTimelineService.of(
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

  FilterRepositoryFilters get filterRepositoryFilters {
    List<MastodonApiFilterContextType>? onlyWithContextTypes;

    switch (timelineType) {
      case TimelineType.public:
        onlyWithContextTypes = [
          MastodonApiFilterContextType.public,
        ];
        break;
      case TimelineType.home:
      case TimelineType.customList:
        onlyWithContextTypes = [
          MastodonApiFilterContextType.homeAndCustomLists,
        ];
        break;
      case TimelineType.hashtag:
        onlyWithContextTypes = [];
        break;
      case TimelineType.account:
        onlyWithContextTypes = [
          MastodonApiFilterContextType.account,
        ];
        break;
    }

    return FilterRepositoryFilters(
      onlyWithContextTypes: onlyWithContextTypes,
      notExpired: true,
    );
  }

  @override
  Future internalAsyncInit() async {
    filters = await filterRepository.findAllInAppType(
      filters: filterRepositoryFilters,
      pagination: null,
      orderingTerms: null,
    );

    addDisposable(
      streamSubscription: filterRepository
          .watchFindAllInAppType(
        filters: filterRepositoryFilters,
        pagination: null,
        orderingTerms: null,
      )
          .listen(
        (newFilters) {
          if (!listEquals(filters, newFilters)) {
            // perhaps we should refresh UI list after this?
            filters = newFilters;
          }
        },
      ),
    );

    _logger.finest(
      () => 'timelineType $timelineType,  filters $filters',
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
