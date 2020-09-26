import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/websockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("timeline_status_cached_list_bloc_impl.dart");

class TimelineStatusCachedListBloc extends DisposableOwner
    implements IStatusCachedListBloc {
  final IPleromaAccountService pleromaAccountService;
  final IPleromaTimelineService pleromaTimelineService;
  final IStatusRepository statusRepository;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final ITimelineSettingsLocalPreferencesBloc
      timelineSettingsLocalPreferencesBloc;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final bool listenWebSockets;

  final TimelineType timelineType;

  TimelineSettings _timelineSettings;

  @override
  Stream<bool> get settingsChangedStream =>
      timelineSettingsLocalPreferencesBloc.stream.map((newTimeline) {
        var changed = newTimeline != _timelineSettings;
        _timelineSettings = newTimeline;
        return changed;
      }).distinct();

  TimelineStatusCachedListBloc({
    @required this.pleromaAccountService,
    @required this.pleromaTimelineService,
    @required this.statusRepository,
    @required this.currentInstanceBloc,
    @required this.timelineSettingsLocalPreferencesBloc,
    @required this.listenWebSockets,
    @required this.webSocketsHandlerManagerBloc,
    @required this.timelineType,
  }) {
    _timelineSettings = timelineSettingsLocalPreferencesBloc.value;

    if (listenWebSockets) {
      switch (timelineType) {
        case TimelineType.public:
          addDisposable(
              disposable: webSocketsHandlerManagerBloc.listenPublicChannel(
            local: _timelineSettings.onlyLocal,
            onlyMedia: _timelineSettings.onlyWithMedia,
          ));

          break;
        case TimelineType.home:
          addDisposable(
              disposable: webSocketsHandlerManagerBloc.listenMyAccountChannel(
            notification: false,
            chat: false,
          ));
          break;
        case TimelineType.customList:
          addDisposable(
              disposable: webSocketsHandlerManagerBloc.listenListChannel(
            listId: _timelineSettings.onlyInRemoteList.id,
          ));
          break;

        case TimelineType.hashtag:
          addDisposable(
              disposable: webSocketsHandlerManagerBloc.listenHashtagChannel(
            hashtag: _timelineSettings.withRemoteHashtag.name,
            local: _timelineSettings.onlyLocal,
          ));
          break;
        case TimelineType.account:
          addDisposable(
              disposable: webSocketsHandlerManagerBloc.listenAccountChannel(
            accountId: _timelineSettings.onlyFromRemoteAccount.id,
            notification: false,
          ));
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
        "\t _timeline = $_timelineSettings"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    List<IPleromaStatus> remoteStatuses;
    var onlyLocal = _timelineSettings.onlyLocal == true;
    var withMuted = _timelineSettings.withMuted == true;
    var onlyWithMedia = _timelineSettings.onlyWithMedia;
    var excludeVisibilities = _timelineSettings.excludeVisibilities;
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
        );
        break;
      case TimelineType.customList:
        remoteStatuses = await pleromaTimelineService.getListTimeline(
          listId: _timelineSettings.onlyInRemoteList.id,
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
        );
        break;
      case TimelineType.hashtag:
        remoteStatuses = await pleromaTimelineService.getHashtagTimeline(
          hashtag: _timelineSettings.withRemoteHashtag.name,
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
          accountRemoteId: _timelineSettings.onlyFromRemoteAccount.id,
          onlyWithMedia: onlyWithMedia,
        );
        break;
    }

    if (remoteStatuses != null) {
      await statusRepository.upsertRemoteStatuses(remoteStatuses,
          listRemoteId: _timelineSettings.onlyInRemoteList.id,
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

    var onlyLocalFilter;
    if (_timelineSettings.onlyLocal == true) {
      var localUrlHost = currentInstanceBloc.currentInstance.urlHost;
      onlyLocalFilter = OnlyLocalStatusFilter(localUrlHost);
    }
    return statusRepository.watchStatuses(
      onlyInConversation: null,
      onlyFromAccount: null,
      onlyInListWithRemoteId: _timelineSettings.onlyInRemoteList.id,
      onlyWithHashtag: _timelineSettings.withRemoteHashtag.name,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocal: onlyLocalFilter,
      onlyWithMedia: _timelineSettings.onlyWithMedia,
      withMuted: _timelineSettings.withMuted,
      excludeVisibilities: _timelineSettings.excludeVisibilities,
      olderThanStatus: null,
      newerThanStatus: item,
      onlyNoNsfwSensitive: _timelineSettings.excludeNsfwSensitive,
      onlyNoReplies: _timelineSettings.excludeReplies,
      limit: null,
      offset: null,
      orderingTermData: StatusOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: StatusOrderByType.remoteId),
      isFromHomeTimeline: isFromHomeTimeline,
      onlyBookmarked: null,
      onlyFavourited: null,
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

    var onlyLocalFilter;
    if (_timelineSettings.onlyLocal == true) {
      var localUrlHost = currentInstanceBloc.currentInstance.urlHost;
      onlyLocalFilter = OnlyLocalStatusFilter(localUrlHost);
    }
    var statuses = await statusRepository.getStatuses(
      onlyInConversation: null,
      onlyFromAccount: null,
      onlyInListWithRemoteId: _timelineSettings.onlyInRemoteList.id,
      onlyWithHashtag: _timelineSettings.withRemoteHashtag.name,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocal: onlyLocalFilter,
      onlyWithMedia: _timelineSettings.onlyWithMedia,
      withMuted: _timelineSettings.withMuted,
      excludeVisibilities: _timelineSettings.excludeVisibilities,
      olderThanStatus: olderThan,
      newerThanStatus: newerThan,
      onlyNoNsfwSensitive: _timelineSettings.excludeNsfwSensitive,
      onlyNoReplies: _timelineSettings.excludeReplies,
      limit: limit,
      offset: null,
      orderingTermData: StatusOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: StatusOrderByType.remoteId),
      isFromHomeTimeline: isFromHomeTimeline,
      onlyBookmarked: null,
      onlyFavourited: null,
    );

    _logger.finer(() =>
        "finish loadLocalItems for $_timelineSettings statuses ${statuses.length}");
    return statuses;
  }

  static TimelineStatusCachedListBloc createFromContext(
    BuildContext context, {
    @required TimelineType timelineType,
    @required
        ITimelineSettingsLocalPreferencesBloc
            timelineSettingsLocalPreferencesBloc,
    @required bool listenWebSockets,
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
        timelineType: timelineType,
        timelineSettingsLocalPreferencesBloc:
            timelineSettingsLocalPreferencesBloc,
        listenWebSockets: listenWebSockets,
        webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
          context,
          listen: false,
        ),
      );
}
