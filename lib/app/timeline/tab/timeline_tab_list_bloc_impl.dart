import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_bloc.dart';
import 'package:fedi/app/websockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class TimelineTabsBloc extends AsyncInitLoadingBloc
    implements ITimelineTabsListBloc {
  BehaviorSubject<List<ITimelineTabBloc>> tabBlocsSubject =
      BehaviorSubject.seeded([]);

  @override
  Stream<List<ITimelineTabBloc>> get tabBlocsStream => tabBlocsSubject.stream;

  @override
  List<ITimelineTabBloc> get tabBlocs => tabBlocsSubject.value;

  // ignore: close_sinks
  BehaviorSubject<ITimelineTabBloc> selectedTabSubject = BehaviorSubject();

  @override
  ITimelineTabBloc get selectedTabBloc => selectedTabSubject.value;

  @override
  Stream<ITimelineTabBloc> get selectedTabBlocStream =>
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
  }) {
    addDisposable(subject: tabBlocsSubject);
    addDisposable(subject: selectedTabSubject);

    addDisposable(streamSubscription:
        timelinesHomeTabStorageBloc.timelineIdsStream.listen((_) {
      updateTabBlocs();
    }));

    addDisposable(disposable: CustomDisposable(() {
      tabBlocs?.forEach((bloc) => bloc.dispose());
    }));
  }

  @override
  Future internalAsyncInit() async {
    await updateTabBlocs();
  }

  Future updateTabBlocs() async {
    tabBlocs?.forEach((bloc) => bloc.dispose());

    var newTabBlocs = <ITimelineTabBloc>[];
    for (var timelineId in timelinesHomeTabStorageBloc.timelineIds) {
      var timelineTabBloc = TimelineTabBloc(
        preferencesService: preferencesService,
        timelineId: timelineId,
        pleromaTimelineService: pleromaTimelineService,
        statusRepository: statusRepository,
        listenWebSockets: listenWebSockets,
        pleromaAccountService: pleromaAccountService,
        webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
        currentAuthInstanceBloc: currentAuthInstanceBloc,
      );

      await timelineTabBloc.performAsyncInit();
      newTabBlocs.add(timelineTabBloc);
    }

    tabBlocsSubject.add(newTabBlocs);

    if (selectedTabBloc == null) {
      selectedTabSubject.add(tabBlocs.first);
    }
  }

  @override
  void selectTab(ITimelineTabBloc tabBloc) {
    selectedTabSubject.add(tabBloc);
  }

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
}
