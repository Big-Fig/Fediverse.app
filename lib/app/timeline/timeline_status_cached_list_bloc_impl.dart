import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("timeline_status_list_service_impl.dart");

abstract class TimelineStatusCachedListBloc extends DisposableOwner
    implements IStatusCachedListBloc {
  final IPleromaTimelineService pleromaTimelineService;
  final IStatusRepository statusRepository;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final TimelineSettingsLocalPreferencesBloc timelineLocalPreferencesBloc;
  final bool isFromHomeTimeline;

  @override
  Stream<bool> get settingsChangedStream => timelineLocalPreferencesBloc.stream
      .distinct()
      .map((preferences) => preferences != null);

  TimelineStatusCachedListBloc({
    @required this.pleromaTimelineService,
    @required this.statusRepository,
    @required this.currentInstanceBloc,
    @required this.timelineLocalPreferencesBloc,
    @required this.isFromHomeTimeline,
  });

  @override
  IPleromaApi get pleromaApi => pleromaTimelineService;

  ITimelineSettings retrieveTimelineSettings();

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    var timelineSettings = retrieveTimelineSettings();
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t timelineSettings = $timelineSettings"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");
    try {
      List<IPleromaStatus> remoteStatuses;
      var onlyLocal = timelineSettings.onlyLocal == true;
      switch (timelineSettings.remoteType) {
        case TimelineRemoteType.public:
          remoteStatuses = await pleromaTimelineService.getPublicTimeline(
            maxId: olderThan?.remoteId,
            sinceId: newerThan?.remoteId,
            limit: limit,
            onlyLocal: onlyLocal,
            onlyWithMedia: timelineLocalPreferencesBloc.value.onlyWithMedia,
            withMuted: !timelineSettings.onlyNotMuted,
            excludeVisibilities: timelineSettings.excludeVisibilities,
          );
          break;
        case TimelineRemoteType.list:
          remoteStatuses = await pleromaTimelineService.getListTimeline(
            listId: timelineSettings.onlyInListWithRemoteId,
            maxId: olderThan?.remoteId,
            sinceId: newerThan?.remoteId,
            limit: limit,
            onlyLocal: onlyLocal,
            onlyWithMedia: timelineLocalPreferencesBloc.value.onlyWithMedia,
            withMuted: !timelineSettings.onlyNotMuted,
            excludeVisibilities: timelineSettings.excludeVisibilities,
          );
          break;
        case TimelineRemoteType.home:
          remoteStatuses = await pleromaTimelineService.getHomeTimeline(
            maxId: olderThan?.remoteId,
            sinceId: newerThan?.remoteId,
            limit: limit,
            onlyLocal: onlyLocal,
            onlyWithMedia: timelineLocalPreferencesBloc.value.onlyWithMedia,
            withMuted: !timelineSettings.onlyNotMuted,
            excludeVisibilities: timelineSettings.excludeVisibilities,
          );
          break;
        case TimelineRemoteType.hashtag:
          remoteStatuses = await pleromaTimelineService.getHashtagTimeline(
            hashtag: timelineSettings.withHashtag,
            maxId: olderThan?.remoteId,
            sinceId: newerThan?.remoteId,
            limit: limit,
            onlyLocal: onlyLocal,
            onlyWithMedia: timelineLocalPreferencesBloc.value.onlyWithMedia,
            withMuted: !timelineSettings.onlyNotMuted,
            excludeVisibilities: timelineSettings.excludeVisibilities,
          );
          break;
      }

      if (remoteStatuses != null) {
        await statusRepository.upsertRemoteStatuses(remoteStatuses,
            listRemoteId: null,
            conversationRemoteId: null,
            isFromHomeTimeline: isFromHomeTimeline);

        return true;
      } else {
        _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
            "statuses is null");
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "error during refreshItemsFromRemoteForPage", e, stackTrace);
      return false;
    }
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item) {
    var timelineSettings = retrieveTimelineSettings();
    _logger.finest(() => "watchLocalItemsNewerThanItem \n"
        "\t item=$item");

    var onlyLocalFilter;
    if (timelineSettings.onlyLocal == true) {
      var localUrlHost = currentInstanceBloc.currentInstance.urlHost;
      onlyLocalFilter = OnlyLocalStatusFilter(localUrlHost);
    }
    var timelineLocalPreferences = timelineLocalPreferencesBloc.value;
    return statusRepository.watchStatuses(
        onlyInConversation: null,
        onlyFromAccount: null,
        onlyInListWithRemoteId: timelineSettings.onlyInListWithRemoteId,
        onlyWithHashtag: timelineSettings.withHashtag,
        onlyFromAccountsFollowingByAccount: null,
        onlyLocal: onlyLocalFilter,
        onlyWithMedia: timelineLocalPreferences.onlyWithMedia,
        onlyNotMuted: timelineSettings.onlyNotMuted,
        excludeVisibilities: timelineSettings.excludeVisibilities,
        olderThanStatus: null,
        newerThanStatus: item,
        isFromHomeTimeline: isFromHomeTimeline,
        onlyNoNsfwSensitive: timelineLocalPreferences.onlyNoNsfwSensitive,
        onlyNoReplies: timelineLocalPreferences.onlyNoReplies,
        limit: null,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId));
  }

  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    var timelineSettings = retrieveTimelineSettings();
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var onlyLocalFilter;
    if (timelineSettings.onlyLocal == true) {
      var localUrlHost = currentInstanceBloc.currentInstance.urlHost;
      onlyLocalFilter = OnlyLocalStatusFilter(localUrlHost);
    }
    var timelineLocalPreferences = timelineLocalPreferencesBloc.value;
    var statuses = await statusRepository.getStatuses(
        onlyInConversation: null,
        onlyFromAccount: null,
        onlyInListWithRemoteId: timelineSettings.onlyInListWithRemoteId,
        onlyWithHashtag: timelineSettings.withHashtag,
        onlyFromAccountsFollowingByAccount: null,
        onlyLocal: onlyLocalFilter,
        onlyWithMedia: timelineLocalPreferences.onlyWithMedia,
        onlyNotMuted: timelineSettings.onlyNotMuted,
        excludeVisibilities: timelineSettings.excludeVisibilities,
        olderThanStatus: olderThan,
        newerThanStatus: newerThan,
        onlyNoNsfwSensitive: timelineLocalPreferences.onlyNoNsfwSensitive,
        onlyNoReplies: timelineLocalPreferences.onlyNoReplies,
        limit: limit,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId),
        isFromHomeTimeline: isFromHomeTimeline);

    _logger.finer(() =>
        "finish loadLocalItems for $timelineSettings statuses ${statuses.length}");
    return statuses;
  }
}
