import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_service.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/public/public_timeline_service_impl.dart';
import 'package:fedi/refactored/app/timeline/public/public_timeline_websockets_handler_impl.dart';
import 'package:fedi/refactored/app/timeline/public/public_timeline_tab_bloc.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_model.dart';

import 'package:fedi/refactored/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';

class PublicTimelineTabBloc extends TimelineTabBloc
    implements IPublicTimelineTabBloc {
  final IPleromaTimelineService pleromaTimelineService;
  final IStatusRepository statusRepository;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc;
  final IPleromaWebSocketsService
  pleromaWebSocketsService;

  PublicTimelineTabBloc(
      {@required this.pleromaTimelineService,
      @required this.statusRepository,
      @required this.timelineLocalPreferencesBloc,
      @required this.currentInstanceBloc,
      @required this.pleromaWebSocketsService})
      : super(tab: TimelineTab.public) {
    addDisposable(
        disposable: PublicTimelineWebSocketsHandler(
            pleromaWebSocketsService:
                pleromaWebSocketsService,
            statusRepository: statusRepository));
  }

  @override
  IStatusCachedListService createListService() => PublicTimelineService(
      pleromaTimelineService: pleromaTimelineService,
      statusRepository: statusRepository,
      currentInstanceBloc: currentInstanceBloc,
      timelineLocalPreferencesBloc: timelineLocalPreferencesBloc);
}
