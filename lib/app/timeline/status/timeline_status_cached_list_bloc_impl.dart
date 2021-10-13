import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
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
import 'package:fedi/repository/repository_model.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('timeline_status_cached_list_bloc_impl.dart');

class TimelineStatusCachedListBloc extends AsyncInitLoadingBloc
    implements IStatusCachedListBloc {
  final IUnifediApiAccountService unifediApiAccountService;
  final IUnifediApiTimelineService unifediApiTimelineService;
  final IStatusRepository statusRepository;
  final IFilterRepository filterRepository;
  final ICurrentUnifediApiAccessBloc currentInstanceBloc;
  final ITimelineLocalPreferenceBlocOld timelineLocalPreferenceBloc;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final IMyAccountBloc myAccountBloc;

  Timeline get timeline => timelineLocalPreferenceBloc.value!;

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

      return StatusOnlyLocalCondition(localUrlHost: localUrlHost);
    } else {
      return null;
    }
  }

  StatusOnlyRemoteCondition? get onlyRemoteCondition {
    if (timeline.onlyRemote == true) {
      var localUrlHost = currentInstanceBloc.currentInstance!.urlHost;

      return StatusOnlyRemoteCondition(localUrlHost: localUrlHost);
    } else {
      return null;
    }
  }

  StatusRepositoryFilters get _statusRepositoryFilters =>
      StatusRepositoryFilters.only(
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
            ? UnifediApiReplyVisibilityFilterCondition(
                myAccountRemoteId: myAccountBloc.myAccount!.remoteId,
                replyVisibilityFilter: timeline.replyVisibilityFilter,
              )
            : null,
        onlyFromInstance: timeline.onlyFromInstance,
        onlyRemoteCondition: onlyRemoteCondition,
      );

  final StreamController settingsChangedStreamController =
      StreamController<dynamic>.broadcast();

  @override
  Stream get settingsChangedStream => settingsChangedStreamController.stream;

  Timeline? currentTimelineData;

  TimelineStatusCachedListBloc({
    required this.unifediApiAccountService,
    required this.unifediApiTimelineService,
    required this.statusRepository,
    required this.filterRepository,
    required this.currentInstanceBloc,
    required this.timelineLocalPreferenceBloc,
    required this.webSocketsHandlerManagerBloc,
    required this.myAccountBloc,
    required WebSocketsChannelHandlerType handlerType,
  }) {
    settingsChangedStreamController.disposeWith(this);

    timelineLocalPreferenceBloc.stream.listen(
      (Timeline? timeline) {
        _logger.finest(
          () => 'timelineLocalPreferencesBloc timeline $timeline',
        );
        if (currentTimelineData != timeline) {
          currentTimelineData = timeline;

          settingsChangedStreamController.add(timeline?.settings);
        }
      },
    ).disposeWith(this);

    resubscribeWebSocketsUpdates(handlerType);

    addCustomDisposable(
      () => webSocketsListenerDisposable?.dispose(),
    );
  }

  IDisposable? webSocketsListenerDisposable;

  void resubscribeWebSocketsUpdates(
    WebSocketsChannelHandlerType handlerType,
  ) {
    webSocketsListenerDisposable?.dispose();

    var isWebSocketsUpdatesEnabled =
        timeline.isWebSocketsUpdatesEnabled ?? true;
    _logger.finest(
      () => 'resubscribeWebSocketsUpdates '
          'isWebSocketsUpdatesEnabled $isWebSocketsUpdatesEnabled '
          'WebSocketsChannelHandlerType $WebSocketsChannelHandlerType '
          'timelineType $timelineType ',
    );
    if (isWebSocketsUpdatesEnabled) {
      switch (timelineType) {
        case TimelineType.public:
          webSocketsListenerDisposable =
              webSocketsHandlerManagerBloc.listenPublicChannel(
            handlerType: handlerType,
            onlyLocal: timeline.onlyLocal,
            onlyMedia: timeline.onlyWithMedia,
            onlyRemote: timeline.onlyRemote,
            onlyFromInstance: timeline.onlyFromInstance,
          );
          break;
        case TimelineType.home:
          webSocketsListenerDisposable =
              webSocketsHandlerManagerBloc.listenMyAccountChannel(
            handlerType: handlerType,
            notification: false,
            chat: false,
          );

          break;
        case TimelineType.customList:
          webSocketsListenerDisposable =
              webSocketsHandlerManagerBloc.listenListChannel(
            handlerType: handlerType,
            listId: timeline.onlyInRemoteList!.id,
          );
          break;

        case TimelineType.hashtag:
          webSocketsListenerDisposable =
              webSocketsHandlerManagerBloc.listenHashtagChannel(
            handlerType: handlerType,
            hashtag: timeline.withRemoteHashtag!,
            local: timeline.onlyLocal,
          );
          break;
        case TimelineType.account:
          // nothing
          break;
      }
    }
  }

  @override
  IUnifediApiService get unifediApi => unifediApiTimelineService;

  bool get isFromHomeTimeline => timelineType == TimelineType.home;

  bool? get onlyLocal => timeline.onlyLocal;

  bool? get onlyRemote => timeline.onlyRemote;

  String? get onlyFromInstance => timeline.onlyFromInstance;

  bool? get withMuted => timeline.withMuted;

  bool? get onlyWithMedia => timeline.onlyWithMedia;

  List<UnifediApiVisibility>? get excludeVisibilities =>
      timeline.excludeVisibilities;

  UnifediApiReplyVisibilityFilter? get replyVisibilityFilter =>
      timeline.replyVisibilityFilter;

  @override
  Future<bool> refreshItemsFromRemoteForPage({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    _logger.fine(
      () => 'start refreshItemsFromRemoteForPage \n'
          '\t _timeline = $timeline'
          '\t newerThan = $newerThan'
          '\t olderThan = $olderThan',
    );

    List<IUnifediApiStatus>? remoteStatuses;

    var pagination = UnifediApiPagination(
      limit: limit,
      minId: newerThan?.remoteId,
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
      _logger.severe(
        () => 'error during refreshItemsFromRemoteForPage: '
            'statuses is null',
      );

      return false;
    }
  }

  Future<List<IUnifediApiStatus>> _loadAccountTimeline() async {
    return unifediApiAccountService.getAccountStatuses(
      pagination: null,
      accountId: timeline.onlyFromRemoteAccount!.id,
      onlyWithMedia: onlyWithMedia,
      pinned: null,
      tagged: null,
      excludeReblogs: null,
      excludeReplies: null,
      excludeVisibilities: null,
      withMuted: null,
    );
  }

  Future<List<IUnifediApiStatus>> _loadHashtagTimeline(
    UnifediApiPagination pagination,
  ) async {
    var withMutedSupported = unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getHashtagTimelineWithMutedFeature,
    );
    var onlyWithMediaSupported = unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getHashtagTimelineOnlyMediaFeature,
    );

    var excludeVisibilitiesSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getHashtagTimelineExcludeVisibilitiesFeature,
    );

    return unifediApiTimelineService.getHashtagTimeline(
      hashtag: timeline.withRemoteHashtag!,
      pagination: pagination,
      onlyLocal: onlyLocal,
      onlyWithMedia: onlyWithMediaSupported ? onlyWithMedia : null,
      withMuted: withMutedSupported ? withMuted : null,
      excludeVisibilities:
          excludeVisibilitiesSupported ? excludeVisibilities : null,
    );
  }

  Future<List<IUnifediApiStatus>> _loadHomeTimeline(
    UnifediApiPagination pagination,
  ) async {
    var withMutedSupported = unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getHomeTimelineWithMutedFeature,
    );
    var replyVisibilityFilterSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getHomeTimelineReplyVisibilityFilterFeature,
    );

    var excludeVisibilitiesSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getHomeTimelineExcludeVisibilitiesFeature,
    );

    return unifediApiTimelineService.getHomeTimeline(
      pagination: pagination,
      onlyLocal: onlyLocal,
      withMuted: withMutedSupported ? withMuted : null,
      excludeVisibilities:
          excludeVisibilitiesSupported ? excludeVisibilities : null,
      replyVisibilityFilter:
          replyVisibilityFilterSupported ? replyVisibilityFilter : null,
    );
  }

  Future<List<IUnifediApiStatus>> _loadListTimeline(
    UnifediApiPagination pagination,
  ) async {
    var withMutedSupported = unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getListTimelineWithMutedFeature,
    );

    var excludeVisibilitiesSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getListTimelineExcludeVisibilitiesFeature,
    );
    var onlyLocalSupported = unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getListTimelineOnlyLocalFilterFeature,
    );

    return unifediApiTimelineService.getListTimeline(
      listId: timeline.onlyInRemoteList!.id,
      pagination: pagination,
      onlyLocal: onlyLocalSupported ? onlyLocal : null,
      withMuted: withMutedSupported ? withMuted : null,
      excludeVisibilities:
          excludeVisibilitiesSupported ? excludeVisibilities : null,
    );
  }

  Future<List<IUnifediApiStatus>> _loadPublicTimeline(
    UnifediApiPagination pagination,
  ) async {
    var withMutedSupported = unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getHomeTimelineWithMutedFeature,
    );
    var replyVisibilityFilterSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getHomeTimelineReplyVisibilityFilterFeature,
    );

    var excludeVisibilitiesSupported =
        unifediApiTimelineService.isFeatureSupported(
      unifediApiTimelineService.getHomeTimelineExcludeVisibilitiesFeature,
    );

    return unifediApiTimelineService.getPublicTimeline(
      pagination: pagination,
      onlyLocal: onlyLocal,
      onlyRemote: onlyRemote,
      onlyFromInstance: onlyFromInstance,
      onlyWithMedia: onlyWithMedia,
      withMuted: withMutedSupported ? withMuted : null,
      excludeVisibilities:
          excludeVisibilitiesSupported ? excludeVisibilities : null,
      replyVisibilityFilter:
          replyVisibilityFilterSupported ? replyVisibilityFilter : null,
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
    required WebSocketsChannelHandlerType handlerType,
    required ITimelineLocalPreferenceBlocOld timelineLocalPreferencesBloc,
  }) =>
      TimelineStatusCachedListBloc(
        unifediApiAccountService: Provider.of<IUnifediApiAccountService>(
          context,
          listen: false,
        ),
        unifediApiTimelineService: Provider.of<IUnifediApiTimelineService>(
          context,
          listen: false,
        ),
        statusRepository: IStatusRepository.of(
          context,
          listen: false,
        ),
        currentInstanceBloc: ICurrentUnifediApiAccessBloc.of(
          context,
          listen: false,
        ),
        timelineLocalPreferenceBloc: timelineLocalPreferencesBloc,
        webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
          context,
          listen: false,
        ),
        handlerType: handlerType,
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
    List<UnifediApiFilterContextType>? onlyWithContextTypes;

    switch (timelineType) {
      case TimelineType.public:
        onlyWithContextTypes = [
          UnifediApiFilterContextType.publicValue,
        ];
        break;
      case TimelineType.home:
      case TimelineType.customList:
        onlyWithContextTypes = [
          UnifediApiFilterContextType.homeValue,
        ];
        break;
      case TimelineType.hashtag:
        onlyWithContextTypes = [];
        break;
      case TimelineType.account:
        onlyWithContextTypes = [
          UnifediApiFilterContextType.accountValue,
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

    filterRepository
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
    ).disposeWith(this);

    _logger.finest(
      () => 'timelineType $timelineType,  filters $filters',
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
