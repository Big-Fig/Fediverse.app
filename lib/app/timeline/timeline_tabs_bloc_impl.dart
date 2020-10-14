import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/home/home_timeline_tab_bloc_impl.dart';
import 'package:fedi/app/timeline/local/local_timeline_tab_bloc_impl.dart';
import 'package:fedi/app/timeline/public/public_timeline_tab_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/home/home_timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/local/local_timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/public/public_timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("timeline_tabs_bloc_impl.dart");

class TimelineTabsBloc extends DisposableOwner implements ITimelineTabsBloc {
  static TimelineTabsBloc createFromContext(
          BuildContext context, TimelineTab startTab) =>
      TimelineTabsBloc(
          startTab: startTab,
          pleromaTimelineService:
              IPleromaTimelineService.of(context, listen: false),
          currentInstanceBloc:
              ICurrentAuthInstanceBloc.of(context, listen: false),
          homeTimelineLocalPreferencesBloc:
              IHomeTimelineSettingsLocalPreferencesBloc.of(context,
                  listen: false),
          localTimelineLocalPreferencesBloc:
              ILocalTimelineSettingsLocalPreferencesBloc.of(context,
                  listen: false),
          publicTimelineLocalPreferencesBloc:
              IPublicTimelineSettingsLocalPreferencesBloc.of(context,
                  listen: false),
          pleromaAccountService:
              IPleromaAccountService.of(context, listen: false),
          pleromaWebSocketsService:
              IPleromaWebSocketsService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          myAccountBloc: IMyAccountBloc.of(context, listen: false),
          accountRepository: IAccountRepository.of(context, listen: false),
          conversationRepository: IConversationRepository.of(context, listen: false),
          notificationRepository: INotificationRepository.of(context, listen: false),
          myAccountSettingsBloc: IMyAccountSettingsBloc.of(context, listen: false),
          chatNewMessagesHandlerBloc: IChatNewMessagesHandlerBloc.of(context, listen: false));

  final Map<TimelineTab, ITimelineTabBloc> tabsMap = {};

  @override
  void selectTab(TimelineTab tab) {
    selectedTabSubject.add(tab);
  }

  // ignore: close_sinks
  BehaviorSubject<TimelineTab> selectedTabSubject;

  @override
  TimelineTab get selectedTab => selectedTabSubject.value;

  @override
  Stream<TimelineTab> get selectedTabStream => selectedTabSubject.stream;

  final IPleromaTimelineService pleromaTimelineService;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final IConversationRepository conversationRepository;
  final INotificationRepository notificationRepository;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final IMyAccountSettingsBloc myAccountSettingsBloc;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final IHomeTimelineSettingsLocalPreferencesBloc
      homeTimelineLocalPreferencesBloc;
  final ILocalTimelineSettingsLocalPreferencesBloc
      localTimelineLocalPreferencesBloc;
  final IPublicTimelineSettingsLocalPreferencesBloc
      publicTimelineLocalPreferencesBloc;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;

  TimelineTabsBloc({
    @required TimelineTab startTab,
    @required this.pleromaTimelineService,
    @required this.pleromaAccountService,
    @required this.statusRepository,
    @required this.accountRepository,
    @required this.conversationRepository,
    @required this.notificationRepository,
    @required this.myAccountBloc,
    @required this.myAccountSettingsBloc,
    @required this.currentInstanceBloc,
    @required this.homeTimelineLocalPreferencesBloc,
    @required this.localTimelineLocalPreferencesBloc,
    @required this.publicTimelineLocalPreferencesBloc,
    @required this.pleromaWebSocketsService,
    @required this.chatNewMessagesHandlerBloc,
  }) {
    selectedTabSubject = BehaviorSubject.seeded(startTab);

    addDisposable(subject: selectedTabSubject);

    _logger.finest(() => "constructor");
    tabsMap.addAll({
      TimelineTab.home: HomeTimelineTabBloc(
          currentInstanceBloc: currentInstanceBloc,
          pleromaAccountService: pleromaAccountService,
          statusRepository: statusRepository,
          accountRepository: accountRepository,
          myAccountBloc: myAccountBloc,
          pleromaWebSocketsService: pleromaWebSocketsService,
          pleromaTimelineService: pleromaTimelineService,
          timelineLocalPreferencesBloc: homeTimelineLocalPreferencesBloc,
          conversationRepository: conversationRepository,
          notificationRepository: notificationRepository,
          listenWebSocketsChanges: myAccountSettingsBloc
              .isRealtimeWebSocketsEnabledFieldBloc.currentValue,
          chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc),
      TimelineTab.local: LocalTimelineTabBloc(
        currentInstanceBloc: currentInstanceBloc,
        statusRepository: statusRepository,
        pleromaWebSocketsService: pleromaWebSocketsService,
        pleromaTimelineService: pleromaTimelineService,
        timelineLocalPreferencesBloc: localTimelineLocalPreferencesBloc,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        listenWebSocketsChanges: myAccountSettingsBloc
            .isRealtimeWebSocketsEnabledFieldBloc.currentValue,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        pleromaAccountService: pleromaAccountService,
      ),
      TimelineTab.public: PublicTimelineTabBloc(
        currentInstanceBloc: currentInstanceBloc,
        statusRepository: statusRepository,
        pleromaWebSocketsService: pleromaWebSocketsService,
        pleromaTimelineService: pleromaTimelineService,
        timelineLocalPreferencesBloc: publicTimelineLocalPreferencesBloc,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        listenWebSocketsChanges: myAccountSettingsBloc
            .isRealtimeWebSocketsEnabledFieldBloc.currentValue,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        pleromaAccountService: pleromaAccountService,
      )
    });

    addDisposable(disposable: CustomDisposable(() {
      tabsMap.values.forEach((bloc) => bloc.dispose());
    }));
  }

  @override
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      retrieveTimelineTabPaginationListBloc(TimelineTab tab) =>
          tabsMap[tab].paginationListWithNewItemsBloc;

  @override
  List<TimelineTab> get tabs => tabsMap.keys.toList();
}
