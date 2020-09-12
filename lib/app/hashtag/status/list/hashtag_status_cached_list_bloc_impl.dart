import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class HashtagStatusCachedListBloc extends TimelineStatusCachedListBloc
    implements IStatusCachedListBloc {
  final IHashtag hashtag;

  @override
  ITimelineSettings retrieveTimelineSettings() => TimelineSettings.hashtag(
        excludeVisibilities: [
          PleromaVisibility.direct,
        ],
        onlyLocal: null,
        onlyNotMuted: true,
        withHashtag: hashtag.name,
      );

  HashtagStatusCachedListBloc({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required TimelineSettingsLocalPreferencesBloc timelineLocalPreferencesBloc,
    @required ICurrentAuthInstanceBloc currentInstanceBloc,
    @required this.hashtag,
  }) : super(
            currentInstanceBloc: currentInstanceBloc,
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
            statusRepository: statusRepository,
            isFromHomeTimeline: false);
}
