import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/local/local_timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/local/local_timeline_websockets_handler_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';

class LocalTimelineTabBloc extends TimelineTabBloc
    implements ILocalTimelineTabBloc {
  final IPleromaTimelineService pleromaTimelineService;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final IConversationRepository conversationRepository;
  final INotificationRepository notificationRepository;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;

  LocalTimelineTabBloc({
    @required this.pleromaTimelineService,
    @required this.pleromaAccountService,
    @required this.statusRepository,
    @required this.conversationRepository,
    @required this.notificationRepository,
    @required
        ITimelineSettingsLocalPreferencesBloc timelineLocalPreferencesBloc,
    @required this.currentInstanceBloc,
    @required this.pleromaWebSocketsService,
    @required this.chatNewMessagesHandlerBloc,
    @required bool listenWebSocketsChanges,
  }) : super(
          tab: TimelineTab.local,
          timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
        ) {
    if (listenWebSocketsChanges) {
      addDisposable(
          disposable: LocalTimelineWebSocketsHandler(
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
      ));
    }
  }

  @override
  IStatusCachedListBloc createListService() => TimelineStatusCachedListBloc(
        pleromaTimelineService: pleromaTimelineService,
        statusRepository: statusRepository,
        currentInstanceBloc: currentInstanceBloc,
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
        pleromaAccountService: pleromaAccountService,
      );
}
