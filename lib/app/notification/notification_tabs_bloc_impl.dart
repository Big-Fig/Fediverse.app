import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/tab/notification_tab_bloc.dart';
import 'package:fedi/app/notification/tab/notification_tab_bloc_impl.dart';
import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('notification_tabs_bloc_impl.dart');

class NotificationsTabsBloc extends AsyncInitLoadingBloc
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
    NotificationTab tab,
  ) =>
      tabsMap[tab]!.paginationListWithNewItemsBloc;

  @override
  void selectTab(NotificationTab tab) {
    selectedTabSubject!.add(tab);
  }

  // ignore: close_sinks
  BehaviorSubject<NotificationTab>? selectedTabSubject;

  @override
  NotificationTab? get selectedTab => selectedTabSubject!.value;

  @override
  Stream<NotificationTab> get selectedTabStream => selectedTabSubject!.stream;

  final IUnifediApiNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;
  final IFilterRepository filterRepository;
  final IPaginationSettingsBloc paginationSettingsBloc;

  NotificationsTabsBloc({
    required NotificationTab startTab,
    required this.pleromaNotificationService,
    required this.notificationRepository,
    required this.filterRepository,
    required this.paginationSettingsBloc,
    required IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc,
  }) {
    selectedTabSubject = BehaviorSubject.seeded(startTab)..disposeWith(this);

    addDisposable(
      webSocketsHandlerManagerBloc.listenMyAccountChannel(
        handlerType: WebSocketsChannelHandlerType.foregroundValue,
        notification: true,
        chat: false,
      ),
    );
  }

  static NotificationsTabsBloc createFromContext(BuildContext context) =>
      NotificationsTabsBloc(
        startTab: NotificationTab.all,
        pleromaNotificationService:
            Provider.of<IUnifediApiNotificationService>(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
          context,
          listen: false,
        ),
        filterRepository: IFilterRepository.of(
          context,
          listen: false,
        ),
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
      );

  @override
  Future internalAsyncInit() async {
    _logger.finest(() => 'internalAsyncInit');

    for (var tab in tabs) {
      var notificationTabBloc = NotificationTabBloc(
        tab: tab,
        notificationRepository: notificationRepository,
        pleromaNotificationService: pleromaNotificationService,
        filterRepository: filterRepository,
        paginationSettingsBloc: paginationSettingsBloc,
      );

      await notificationTabBloc.performAsyncInit();

      tabsMap[tab] = notificationTabBloc;
    }

    addCustomDisposable(
      () async {
        await Future.wait(
          tabsMap.values.map(
            (bloc) => bloc.dispose(),
          ),
        );
      },
    );
  }
}
