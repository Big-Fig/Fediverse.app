import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_model.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/websockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class TimelineTabsBloc extends AsyncInitLoadingBloc
    implements ITimelineTabsBloc {
  static TimelineTabsBloc createFromContext(BuildContext context) =>
      TimelineTabsBloc(
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
            IConversationRepository.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        myAccountSettingsBloc:
            IMyAccountSettingsBloc.of(context, listen: false),
        chatNewMessagesHandlerBloc:
            IChatNewMessagesHandlerBloc.of(context, listen: false),
        timelinesHomeTabStorageBloc: ITimelinesHomeTabStorageBloc.of(
          context,
          listen: false,
        ),
        currentAuthInstanceBloc:
            ICurrentAuthInstanceBloc.of(context, listen: false),
        preferencesService: ILocalPreferencesService.of(context, listen: false),
        webSocketsHandlerManagerBloc:
            IWebSocketsHandlerManagerBloc.of(context, listen: false),
        listenWebSockets: IMyAccountSettingsBloc.of(context, listen: false)
                .isRealtimeWebSocketsEnabledFieldBloc
                .currentValue ==
            true,
      );

  final Map<TimelinesHomeTabItem, ITimelineTabBloc> tabsMap = {};
  final Map<TimelinesHomeTabItem, ITimelineSettingsLocalPreferencesBloc>
      tabsPreferenceMap = {};

  @override
  void selectTab(TimelinesHomeTabItem tab) {
    selectedTabSubject.add(tab);
  }

  // ignore: close_sinks
  BehaviorSubject<TimelinesHomeTabItem> selectedTabSubject;

  @override
  TimelinesHomeTabItem get selectedTab => selectedTabSubject.value;

  @override
  Stream<TimelinesHomeTabItem> get selectedTabStream =>
      selectedTabSubject.stream;

  final ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc;
  final IPleromaTimelineService pleromaTimelineService;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final IConversationRepository conversationRepository;
  final INotificationRepository notificationRepository;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final IMyAccountSettingsBloc myAccountSettingsBloc;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc;
  final bool listenWebSockets;
  final ILocalPreferencesService preferencesService;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;

  TimelineTabsBloc({
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
    @required this.timelinesHomeTabStorageBloc,
    @required this.pleromaWebSocketsService,
    @required this.chatNewMessagesHandlerBloc,
    @required this.webSocketsHandlerManagerBloc,
    @required this.listenWebSockets,
  });

  @override
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      retrieveTimelineTabPaginationListBloc(TimelinesHomeTabItem tab) =>
          tabsMap[tab].paginationListWithNewItemsBloc;

  @override
  List<TimelinesHomeTabItem> get tabs => tabsMap.keys.toList();

  @override
  ITimelineSettingsLocalPreferencesBloc retrieveTimelineTabSettingsBloc(
          TimelinesHomeTabItem tab) =>
      tabsPreferenceMap[tab];

  @override
  Future internalAsyncInit() async {
    selectedTabSubject =
        BehaviorSubject.seeded(timelinesHomeTabStorageBloc.items.first);

    for (var tabItem in timelinesHomeTabStorageBloc.items) {
      var preferencesBloc = TimelineSettingsLocalPreferencesBloc.byId(
        preferencesService,
        userAtHost: currentAuthInstanceBloc.currentInstance.userAtHost,
        timelineId: tabItem.timelineSettingsId,
      );
      await preferencesBloc.performAsyncInit();
      tabsPreferenceMap[tabItem] = preferencesBloc;
      tabsMap[tabItem] = TimelineTabBloc(
        timelineLocalPreferencesBloc: preferencesBloc,
        tab: tabItem,
        pleromaTimelineService: pleromaTimelineService,
        statusRepository: statusRepository,
        listenWebSockets: listenWebSockets,
        pleromaAccountService: pleromaAccountService,
        webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
        currentAuthInstanceBloc: currentAuthInstanceBloc,
      );
    }

    addDisposable(subject: selectedTabSubject);

    addDisposable(disposable: CustomDisposable(() {
      tabsMap.values.forEach((bloc) => bloc.dispose());
      tabsPreferenceMap.values.forEach((bloc) => bloc.dispose());
    }));
  }
}
