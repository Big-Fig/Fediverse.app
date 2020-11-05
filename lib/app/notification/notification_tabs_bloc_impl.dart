import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/tab/notification_tab_bloc.dart';
import 'package:fedi/app/notification/tab/notification_tab_bloc_impl.dart';
import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/app/notification/websockets/my_notifications_websockets_handler_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("notification_tabs_bloc_impl.dart");

class NotificationsTabsBloc extends DisposableOwner
    implements INotificationTabsBloc {
  @override
  List<NotificationTab> tabs = [
    NotificationTab.all,
    NotificationTab.mentions,
    NotificationTab.reblogs,
    NotificationTab.favourites,
    NotificationTab.follows,
  ];

  final Map<NotificationTab, INotificationTabBloc> tabsMap = {};

  @override
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<INotification>,
      INotification> retrieveTimelineTabPaginationListBloc(
      NotificationTab tab) =>
      tabsMap[tab].paginationListWithNewItemsBloc;

  @override
  void selectTab(NotificationTab tab) {
    selectedTabSubject.add(tab);
  }

  // ignore: close_sinks
  BehaviorSubject<NotificationTab> selectedTabSubject;

  @override
  NotificationTab get selectedTab => selectedTabSubject.value;

  @override
  Stream<NotificationTab> get selectedTabStream => selectedTabSubject.stream;

  final IPleromaNotificationService pleromaNotificationService;
  final IPleromaAccountService pleromaAccountService;
  final IConversationChatRepository conversationRepository;
  final INotificationRepository notificationRepository;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;

  NotificationsTabsBloc({
    @required NotificationTab startTab,
    @required this.pleromaNotificationService,
    @required this.pleromaAccountService,
    @required this.notificationRepository,
    @required this.conversationRepository,
    @required this.statusRepository,
    @required this.accountRepository,
    @required this.myAccountBloc,
    @required this.currentInstanceBloc,
    @required this.pleromaWebSocketsService,
    @required bool listenWebSocketsChanges,
    @required this.chatNewMessagesHandlerBloc,
    @required
    IConversationChatNewMessagesHandlerBloc
    conversationChatNewMessagesHandlerBloc,
  }) {
    selectedTabSubject = BehaviorSubject.seeded(startTab);

    addDisposable(subject: selectedTabSubject);

    if (listenWebSocketsChanges) {
      addDisposable(
          disposable: MyNotificationsWebSocketsHandler(
            conversationRepository: conversationRepository,
            statusRepository: statusRepository,
            notificationRepository: notificationRepository,
            pleromaWebSocketsService: pleromaWebSocketsService,
            chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
            conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
          ));
    }

    tabs.forEach((tab) {
      tabsMap[tab] = NotificationTabBloc(
          tab: tab,
          notificationRepository: notificationRepository,
          pleromaNotificationService: pleromaNotificationService,
      );
    });

    addDisposable(custom: () {
      tabsMap.values.forEach((bloc) => bloc.dispose());
    });

    _logger.finest(() => "constructor");
  }

  static NotificationsTabsBloc createFromContext(BuildContext context) =>
      NotificationsTabsBloc(
          startTab: NotificationTab.all,
          pleromaNotificationService:
          IPleromaNotificationService.of(context, listen: false),
          pleromaAccountService:
          IPleromaAccountService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          accountRepository: IAccountRepository.of(context, listen: false),
          myAccountBloc: IMyAccountBloc.of(context, listen: false),
          currentInstanceBloc:
          ICurrentAuthInstanceBloc.of(context, listen: false),
          pleromaWebSocketsService:
          IPleromaWebSocketsService.of(context, listen: false),
          conversationRepository:
          IConversationChatRepository.of(context, listen: false),
          notificationRepository:
          INotificationRepository.of(context, listen: false),
          listenWebSocketsChanges:
          IMyAccountSettingsBloc
              .of(context, listen: false)
              .isRealtimeWebSocketsEnabledFieldBloc
              .currentValue,
          chatNewMessagesHandlerBloc:
          IPleromaChatNewMessagesHandlerBloc.of(context, listen: false),
        conversationChatNewMessagesHandlerBloc:
        IConversationChatNewMessagesHandlerBloc.of(context, listen: false),
      );
}
