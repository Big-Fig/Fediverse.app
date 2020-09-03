import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class CustomListStatusCachedListBloc
    extends TimelineStatusCachedListBloc implements IStatusCachedListBloc {
  final ICustomList customList;

  @override
  ITimelineSettings retrieveTimelineSettings() => TimelineSettings.list(
        excludeVisibilities: [
          PleromaVisibility.DIRECT,
        ],
        onlyLocal: null,
        onlyNotMuted: true,
        onlyInListWithRemoteId: customList.remoteId,
      );

  CustomListStatusCachedListBloc({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required TimelineSettingsLocalPreferencesBloc timelineLocalPreferencesBloc,
    @required ICurrentAuthInstanceBloc currentInstanceBloc,
    @required this.customList,
  }) : super(
            currentInstanceBloc: currentInstanceBloc,
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
            statusRepository: statusRepository,
            isFromHomeTimeline: false);
}
