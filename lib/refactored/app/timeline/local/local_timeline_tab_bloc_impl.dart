import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/timeline/local/local_timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/local/local_timeline_tab_bloc.dart';
import 'package:fedi/refactored/app/timeline/local/local_timeline_websockets_handler_impl.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/refactored/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';

class LocalTimelineTabBloc extends TimelineTabBloc
    implements ILocalTimelineTabBloc {
  final IPleromaTimelineService pleromaTimelineService;
  final IStatusRepository statusRepository;
  final IConversationRepository conversationRepository;
  final INotificationRepository notificationRepository;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc;
  final IPleromaWebSocketsService pleromaWebSocketsService;

  LocalTimelineTabBloc(
      {@required this.pleromaTimelineService,
      @required this.statusRepository,
      @required this.conversationRepository,
      @required this.notificationRepository,
      @required this.timelineLocalPreferencesBloc,
      @required this.currentInstanceBloc,
      @required this.pleromaWebSocketsService,
      @required bool listenWebSocketsChanges})
      : super(tab: TimelineTab.local) {
    if (listenWebSocketsChanges) {
      addDisposable(
          disposable: LocalTimelineWebSocketsHandler(
              pleromaWebSocketsService: pleromaWebSocketsService,
              statusRepository: statusRepository,
              conversationRepository: conversationRepository,
              notificationRepository: notificationRepository));
    }
  }

  @override
  IStatusCachedListBloc createListService() =>
      LocalTimelineStatusCachedListBloc(
          pleromaTimelineService: pleromaTimelineService,
          statusRepository: statusRepository,
          currentInstanceBloc: currentInstanceBloc,
          timelineLocalPreferencesBloc: timelineLocalPreferencesBloc);
}
