import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/websockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger("timeline_tab_list_bloc_impl.dart");

class TimelineTabListBloc extends AsyncInitLoadingBloc
    implements ITimelineTabListBloc {
  BehaviorSubject<TimelineTabBlocsList> timelineTabBlocsListSubject =
      BehaviorSubject();

  @override
  Stream<TimelineTabBlocsList> get timelineTabBlocsListStream =>
      timelineTabBlocsListSubject.stream;

  @override
  TimelineTabBlocsList get timelineTabBlocsList =>
      timelineTabBlocsListSubject.value;

  @override
  Stream<ITimelineTabBloc> get mainTimelineTabBlocStream =>
      timelineTabBlocsListStream.map((timelineTabBlocsList) {
        var mainTimelineTabBloc;

        if (timelineTabBlocsList != null) {
          mainTimelineTabBloc =
              timelineTabBlocsList.timelineTabBlocs.firstWhere(
            (timelineTabBloc) =>
                timelineTabBloc.timeline.type == TimelineType.home,
            orElse: () => null,
          );
        }
        return mainTimelineTabBloc;
      });

  final ITimelinesHomeTabStorageLocalPreferences
      timelinesHomeTabStorageLocalPreferences;
  final IPleromaTimelineService pleromaTimelineService;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final IConversationChatRepository conversationRepository;
  final INotificationRepository notificationRepository;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final IMyAccountSettingsBloc myAccountSettingsBloc;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final bool listenWebSockets;
  final ILocalPreferencesService preferencesService;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final TickerProvider vsync;
  VoidCallback tabControllerListener;

  TimelineTabListBloc({
    @required this.preferencesService,
    @required this.currentAuthInstanceBloc,
    @required this.pleromaTimelineService,
    @required this.pleromaAccountService,
    @required this.statusRepository,
    @required this.accountRepository,
    @required this.conversationRepository,
    @required this.notificationRepository,
    @required this.myAccountBloc,
    @required this.myAccountSettingsBloc,
    @required this.currentInstanceBloc,
    @required this.timelinesHomeTabStorageLocalPreferences,
    @required this.pleromaWebSocketsService,
    @required this.chatNewMessagesHandlerBloc,
    @required this.webSocketsHandlerManagerBloc,
    @required this.listenWebSockets,
    @required this.vsync,
  }) {
    addDisposable(subject: timelineTabBlocsListSubject);

    addDisposable(streamSubscription:
        timelinesHomeTabStorageLocalPreferences.stream.listen((_) {
      updateTabBlocs();
    }));

    addDisposable(custom: () async {
      await disposeTabControllerListener();
    });
  }

  Future disposeTabControllerListener() async {
    if (tabControllerListener != null &&
        timelineTabBlocsList?.tabController != null) {
      timelineTabBlocsList.tabController.removeListener(tabControllerListener);
      tabControllerListener = null;
    }

    for (ITimelineTabBloc bloc
        in timelineTabBlocsList?.timelineTabBlocs ?? []) {
      await bloc.dispose();
    }
  }

  @override
  Future internalAsyncInit() async {
    await updateTabBlocs();
  }

  bool updateTabBlocsInProgress = false;

  Future updateTabBlocs() async {
    _logger.finest(() => "updateTabBlocs "
        "updateTabBlocsInProgress $updateTabBlocsInProgress");

    if (updateTabBlocsInProgress) {
      return;
    }

    updateTabBlocsInProgress = true;

    var oldTimelineIds = timelineTabBlocsList?.timelineTabBlocs
            ?.map((timelineTabBloc) => timelineTabBloc.timelineId)
            ?.toList() ??
        [];

    var newTimelineIds =
        timelinesHomeTabStorageLocalPreferences.value.timelineIds;

    if (listEquals(oldTimelineIds, newTimelineIds)) {
      return;
    }

    await disposeTabControllerListener();

    var oldBlocs = timelineTabBlocsList?.timelineTabBlocs;
    var oldTabController = timelineTabBlocsList?.tabController;

    timelineTabBlocsListSubject.add(null);

    var oldSelectedIndex = oldTabController?.index;

    var newTabBlocs = <ITimelineTabBloc>[];
    for (var timelineId in newTimelineIds) {
      var timelineTabBloc = TimelineTabBloc(
        preferencesService: preferencesService,
        timelineId: timelineId,
        pleromaTimelineService: pleromaTimelineService,
        statusRepository: statusRepository,
        listenWebSockets: listenWebSockets,
        pleromaAccountService: pleromaAccountService,
        webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
        currentAuthInstanceBloc: currentAuthInstanceBloc,
        myAccountBloc: myAccountBloc,
      );

      await timelineTabBloc.performAsyncInit();
      newTabBlocs.add(timelineTabBloc);
    }
    int initialIndex;

    if (oldBlocs != null && oldSelectedIndex != null) {
      var oldSelectedBloc = oldBlocs[oldSelectedIndex];

      initialIndex = newTabBlocs
          .indexWhere((bloc) => bloc.timelineId == oldSelectedBloc.timelineId);

      if (initialIndex == -1) {
        initialIndex = null;
      }
    }

    var tabController = TabController(
      length: newTabBlocs.length,
      vsync: vsync,
      // initialIndex: initialIndex ?? 0,
    );

    tabController.animateTo(initialIndex ?? 0);

    tabControllerListener = () {
      var index = tabController.index;
      var tabBloc = newTabBlocs[index];

      // merge unmerged on selection
      var paginationListBloc = tabBloc.paginationListWithNewItemsBloc;
      if (paginationListBloc.unmergedNewItemsCount > 0) {
        paginationListBloc.mergeNewItems();
      }
    };
    tabController.addListener(tabControllerListener);

    timelineTabBlocsListSubject.add(
      TimelineTabBlocsList(
        tabController: tabController,
        timelineTabBlocs: newTabBlocs,
      ),
    );

    updateTabBlocsInProgress = false;

    Future.delayed(Duration(seconds: 1), () {
      oldBlocs?.forEach((bloc) => bloc.dispose());
      oldTabController?.dispose();
    });
  }

  static TimelineTabListBloc createFromContext(
    BuildContext context, {
    @required TickerProvider vsync,
  }) =>
      TimelineTabListBloc(
        vsync: vsync,
        pleromaTimelineService:
            IPleromaTimelineService.of(context, listen: false),
        currentInstanceBloc:
            ICurrentAuthInstanceBloc.of(context, listen: false),
        pleromaAccountService:
            IPleromaAccountService.of(context, listen: false),
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        conversationRepository:
            IConversationChatRepository.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        myAccountSettingsBloc:
            IMyAccountSettingsBloc.of(context, listen: false),
        chatNewMessagesHandlerBloc:
            IPleromaChatNewMessagesHandlerBloc.of(context, listen: false),
        currentAuthInstanceBloc:
            ICurrentAuthInstanceBloc.of(context, listen: false),
        preferencesService: ILocalPreferencesService.of(context, listen: false),
        webSocketsHandlerManagerBloc:
            IWebSocketsHandlerManagerBloc.of(context, listen: false),
        listenWebSockets: IMyAccountSettingsBloc.of(context, listen: false)
                .isRealtimeWebSocketsEnabledFieldBloc
                .currentValue ==
            true,
        timelinesHomeTabStorageLocalPreferences:
            ITimelinesHomeTabStorageLocalPreferences.of(
          context,
          listen: false,
        ),
      );
}
