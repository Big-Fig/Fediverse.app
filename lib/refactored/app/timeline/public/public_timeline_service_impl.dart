import 'package:fedi/refactored/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_instance_bloc.dart';
import 'package:fedi/refactored/app/status/list/status_list_service.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/timeline_model.dart';
import 'package:fedi/refactored/app/timeline/timeline_status_list_service_impl.dart';
import 'package:flutter/widgets.dart';

class PublicTimelineService extends TimelineStatusListService
    implements IStatusListService {
  @override
  ITimelineSettings retrieveTimelineSettings() => TimelineSettings.public(
        excludeVisibilities: [
          PleromaVisibility.DIRECT,
          PleromaVisibility.PRIVATE,
          PleromaVisibility.LIST,
          PleromaVisibility.UNLISTED
        ],
        onlyLocal: false,
        onlyNotMuted: true,
      );

  PublicTimelineService({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required ICurrentInstanceBloc currentInstanceBloc,
    @required TimelineLocalPreferencesBloc timelineLocalPreferencesBloc,
  }) : super(
            currentInstanceBloc: currentInstanceBloc,
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
            statusRepository: statusRepository);
}
