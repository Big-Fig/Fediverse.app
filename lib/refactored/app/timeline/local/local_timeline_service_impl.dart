import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_service.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/timeline_model.dart';
import 'package:fedi/refactored/app/timeline/timeline_status_list_service_impl.dart';
import 'package:fedi/refactored/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class LocalTimelineService extends TimelineStatusListService
    implements IStatusCachedListService {
  @override
  ITimelineSettings retrieveTimelineSettings() => TimelineSettings.public(
        excludeVisibilities: [
          PleromaVisibility.DIRECT,
          PleromaVisibility.PRIVATE,
          PleromaVisibility.LIST,
          PleromaVisibility.UNLISTED
        ],
        onlyLocal: true,
        onlyNotMuted: true,
      );

  LocalTimelineService({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required ICurrentAuthInstanceBloc currentInstanceBloc,
    @required TimelineLocalPreferencesBloc timelineLocalPreferencesBloc,
  }) : super(
            currentInstanceBloc: currentInstanceBloc,
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
            statusRepository: statusRepository);
}
