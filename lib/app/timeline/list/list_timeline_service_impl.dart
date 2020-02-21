import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/timeline_service_impl.dart';
import 'package:flutter/widgets.dart';

import 'list_timeline_service.dart';

class ListTimelineService extends TimelineService
    implements IListTimelineService {
  final bool onlyLocal;
  final String localUrlHost;
  final String listRemoteId;

  @override
  ITimelineSettings get settings => TimelineSettings.list(
      localPreferences: null,
      excludeVisibilities: [
        PleromaVisibility.DIRECT,
        PleromaVisibility.LIST,
        PleromaVisibility.UNLISTED
      ],
      onlyLocal: onlyLocal,
      notMuted: true,
      localUrlHost: localUrlHost,
      inListWithRemoteId: listRemoteId);

  ListTimelineService({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required TimelineLocalPreferences timelineLocalPreferences,
    @required this.onlyLocal,
    @required this.localUrlHost,
    @required this.listRemoteId,
  }) : super(
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferences: timelineLocalPreferences,
            statusRepository: statusRepository);
}
