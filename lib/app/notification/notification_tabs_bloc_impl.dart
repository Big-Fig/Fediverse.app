import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/tab/notification_tab_bloc.dart';
import 'package:fedi/app/notification/tab/notification_tab_bloc_impl.dart';
import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
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
  final INotificationRepository notificationRepository;

  NotificationsTabsBloc({
    @required NotificationTab startTab,
    @required this.pleromaNotificationService,
    @required this.notificationRepository,
    @required IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc,
  }) {
    selectedTabSubject = BehaviorSubject.seeded(startTab);

    addDisposable(subject: selectedTabSubject);

    addDisposable(
      disposable: webSocketsHandlerManagerBloc.listenMyAccountChannel(
        listenType: WebSocketsListenType.foreground,
        notification: true,
        chat: false,
      ),
    );

    tabs.forEach(
      (tab) {
        tabsMap[tab] = NotificationTabBloc(
          tab: tab,
          notificationRepository: notificationRepository,
          pleromaNotificationService: pleromaNotificationService,
        );
      },
    );

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
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
          context,
          listen: false,
        ),
      );
}
