import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
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
  final TimelineSettingsLocalPreferencesBloc timelineLocalPreferencesBloc;

  TimelineSettings _timelineSettings;

  @override
  Stream<bool> get settingsChangedStream =>
      timelineLocalPreferencesBloc.stream.map((preferences) {
        var changed = preferences != _timelineSettings;
        _timelineSettings = preferences;
        return changed;
      }).distinct();

  TimelineStatusCachedListBloc({
    @required this.pleromaAccountService,
    @required this.pleromaTimelineService,
    @required this.statusRepository,
    @required this.currentInstanceBloc,
    @required this.timelineLocalPreferencesBloc,
  }) {
    _timelineSettings = timelineLocalPreferencesBloc.value;
  }

  @override
  IPleromaApi get pleromaApi => pleromaTimelineService;

  bool get isFromHomeTimeline =>
      _timelineSettings.remoteType == TimelineRemoteType.home;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t _timelineSettings = $_timelineSettings"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    List<IPleromaStatus> remoteStatuses;
    var onlyLocal = _timelineSettings.onlyLocal == true;
    var withMuted = _timelineSettings.withMuted == true;
    var onlyWithMedia = _timelineSettings.onlyWithMedia;
    var excludeVisibilities = _timelineSettings.excludeVisibilities;
    var maxId = olderThan?.remoteId;
    var sinceId = newerThan?.remoteId;
    switch (_timelineSettings.remoteType) {
      case TimelineRemoteType.public:
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
      case TimelineRemoteType.list:
        remoteStatuses = await pleromaTimelineService.getListTimeline(
          listId: _timelineSettings.onlyInListWithRemoteId,
          maxId: maxId,
          sinceId: sinceId,
          limit: limit,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
        );
        break;
      case TimelineRemoteType.home:
        remoteStatuses = await pleromaTimelineService.getHomeTimeline(
          maxId: maxId,
          sinceId: sinceId,
          limit: limit,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
        );
        break;
      case TimelineRemoteType.hashtag:
        remoteStatuses = await pleromaTimelineService.getHashtagTimeline(
          hashtag: _timelineSettings.withHashtag,
          maxId: maxId,
          sinceId: sinceId,
          limit: limit,
          onlyLocal: onlyLocal,
          onlyWithMedia: timelineLocalPreferencesBloc.value.onlyWithMedia,
          withMuted: withMuted,
          excludeVisibilities: excludeVisibilities,
        );
        break;
      case TimelineRemoteType.account:
        remoteStatuses = await pleromaAccountService.getAccountStatuses(
          accountRemoteId: _timelineSettings.onlyFromAccountWithRemoteId,
          onlyWithMedia: onlyWithMedia,
        );
        break;
    }

    if (remoteStatuses != null) {
      await statusRepository.upsertRemoteStatuses(remoteStatuses,
          listRemoteId: _timelineSettings.onlyInListWithRemoteId,
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
    var timelineLocalPreferences = timelineLocalPreferencesBloc.value;
    return statusRepository.watchStatuses(
      onlyInConversation: null,
      onlyFromAccount: null,
      onlyInListWithRemoteId: _timelineSettings.onlyInListWithRemoteId,
      onlyWithHashtag: _timelineSettings.withHashtag,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocal: onlyLocalFilter,
      onlyWithMedia: timelineLocalPreferences.onlyWithMedia,
      withMuted: _timelineSettings.withMuted,
      excludeVisibilities: _timelineSettings.excludeVisibilities,
      olderThanStatus: null,
      newerThanStatus: item,
      onlyNoNsfwSensitive: timelineLocalPreferences.onlyNoNsfwSensitive,
      onlyNoReplies: timelineLocalPreferences.onlyNoReplies,
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
    var timelineLocalPreferences = timelineLocalPreferencesBloc.value;
    var statuses = await statusRepository.getStatuses(
      onlyInConversation: null,
      onlyFromAccount: null,
      onlyInListWithRemoteId: _timelineSettings.onlyInListWithRemoteId,
      onlyWithHashtag: _timelineSettings.withHashtag,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocal: onlyLocalFilter,
      onlyWithMedia: timelineLocalPreferences.onlyWithMedia,
      withMuted: _timelineSettings.withMuted,
      excludeVisibilities: _timelineSettings.excludeVisibilities,
      olderThanStatus: olderThan,
      newerThanStatus: newerThan,
      onlyNoNsfwSensitive: timelineLocalPreferences.onlyNoNsfwSensitive,
      onlyNoReplies: timelineLocalPreferences.onlyNoReplies,
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
}
