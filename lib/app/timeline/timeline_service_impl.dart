import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/timeline_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("timeline_service_impl.dart");

abstract class TimelineService extends DisposableOwner
    implements ITimelineService {
  final IPleromaTimelineService pleromaTimelineService;
  final IStatusRepository statusRepository;
  final TimelineLocalPreferences timelineLocalPreferences;

  TimelineService(
      {@required this.pleromaTimelineService,
      @required this.statusRepository,
      @required this.timelineLocalPreferences});

  @override
  IPleromaApi get pleromaApi => pleromaTimelineService;

  ITimelineSettings get settings;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThanStatus,
      @required IStatus olderThanStatus}) async {
//    try {
    List<IPleromaStatus> remoteStatuses;
    switch (settings.remoteType) {
      case TimelineRemoteType.public:
        remoteStatuses = await pleromaTimelineService.getPublicTimeline(
          maxId: olderThanStatus?.remoteId,
          sinceId: newerThanStatus?.remoteId,
          limit: limit,
          onlyLocal: settings.onlyLocal,
          onlyMedia: settings.onlyMedia,
          withMuted: !settings.notMuted,
          excludeVisibilities: settings.excludeVisibilities,
        );
        break;
      case TimelineRemoteType.list:
        remoteStatuses = await pleromaTimelineService.getListTimeline(
          listId: settings.inListWithRemoteId,
          maxId: olderThanStatus?.remoteId,
          sinceId: newerThanStatus?.remoteId,
          limit: limit,
          onlyLocal: settings.onlyLocal,
          onlyMedia: settings.onlyMedia,
          withMuted: !settings.notMuted,
          excludeVisibilities: settings.excludeVisibilities,
        );
        break;
      case TimelineRemoteType.home:
        remoteStatuses = await pleromaTimelineService.getHomeTimeline(
          maxId: olderThanStatus?.remoteId,
          sinceId: newerThanStatus?.remoteId,
          limit: limit,
          onlyLocal: settings.onlyLocal,
          onlyMedia: settings.onlyMedia,
          withMuted: !settings.notMuted,
          excludeVisibilities: settings.excludeVisibilities,
        );
        break;
      case TimelineRemoteType.hashtag:
        remoteStatuses = await pleromaTimelineService.getHashtagTimeline(
          hashtag: settings.withHashtag,
          maxId: olderThanStatus?.remoteId,
          sinceId: newerThanStatus?.remoteId,
          limit: limit,
          onlyLocal: settings.onlyLocal,
          onlyMedia: settings.onlyMedia,
          withMuted: !settings.notMuted,
          excludeVisibilities: settings.excludeVisibilities,
        );
        break;
    }

    if (remoteStatuses != null) {
      await statusRepository.upsertRemoteStatuses(remoteStatuses,
          listRemoteId: null);
//         var statuses = await statusRepository.getAll();
//         _logger.fine(() => "statuses = ${statuses.length}");

      return true;
    } else {
      _logger.shout(() => "error during refreshItemsFromRemoteForPage: "
          "statuses is null");
      return false;
    }
//    } catch (e) {
//      _logger.shout(() => "error during refreshItemsFromRemoteForPage $e");
//      return false;
//    }
  }

  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThanStatus,
      @required IStatus olderThanStatus}) async {
    var timelineSettings = settings;

    var statuses = await statusRepository.getStatuses(
        inListWithRemoteId: timelineSettings.inListWithRemoteId,
        withHashtag: timelineSettings.withHashtag,
        onlyFollowingByAccount: timelineSettings.homeAccount,
        localUrlHost: timelineSettings.localUrlHost,
        onlyLocal: timelineSettings.onlyLocal,
        onlyMedia: timelineSettings.onlyMedia,
        notMuted: timelineSettings.notMuted,
        excludeVisibilities: timelineSettings.excludeVisibilities,
        olderThanStatusRemoteId: olderThanStatus?.remoteId,
        newerThanStatusRemoteId: newerThanStatus?.remoteId,
        noNsfwSensitive: timelineSettings.noNsfwSensitive,
        noReplies: timelineSettings.noReplies,
        limit: limit,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId));
    return statuses;
  }
}
