import 'package:fedi/refactored/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc.dart';
import 'package:fedi/refactored/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc_impl.dart';
import 'package:fedi/refactored/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_widget.dart';
import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_model.dart';
import 'package:fedi/refactored/app/notification/list/cached/notification_cached_list_service.dart';
import 'package:fedi/refactored/app/notification/list/cached/notification_cached_list_service_impl.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/pagination/cached/notification_cached_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/notification/pagination/list/notification_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/notification/pagination/list/notification_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/notification/pagination/list/notification_pagination_list_widget.dart';
import 'package:fedi/refactored/app/notification/unread/notification_unread_type_badge_count_widget.dart';
import 'package:fedi/refactored/app/push/subscription/push_subscription_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("notifications_home_tab_page.dart");

List<NotificationTab> tabs = [
  NotificationTab.all,
  NotificationTab.mentions,
  NotificationTab.reblogs,
  NotificationTab.favourites,
  NotificationTab.follows,
];

class NotificationsHomeTabPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  NotificationsHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationsHomePageBloc =
        INotificationsHomeTabBloc.of(context, listen: true);

    _logger.finest(() => "build");

    return Scaffold(
      key: _drawerKey,
      endDrawer: DisposableProvider<INotificationsHomeTabPageDrawerBloc>(
        create: (BuildContext context) => NotificationsHomeTabPageDrawerBloc(
            pushSettingsBloc: IPushSubscriptionBloc.of(context, listen: false)),
        child: NotificationsHomeTabPageDrawerWidget(),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: tabs.length,
          initialIndex: tabs.indexOf(notificationsHomePageBloc.selectedTab),
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: buildTabBar(context, tabs, notificationsHomePageBloc)),
              Expanded(child: buildBodyWidget(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabBar(BuildContext context, List<NotificationTab> tabs,
          INotificationsHomeTabBloc notificationsHomePageBloc) =>
      Row(
        children: [
          Flexible(
            child: TabBar(
              tabs: tabs.map((tab) {
                return buildTab(context, tab);
              }).toList(),
              onTap: (index) {
                notificationsHomePageBloc.selectTab(tabs[index]);
              },
            ),
          ),
          Row(
            children: <Widget>[
              buildSettingsActionButton(),
            ],
          )
        ],
      );

  Tab buildTab(BuildContext context, NotificationTab tab) {
    MastodonNotificationType type = mapTabToType(tab);
    return Tab(
      icon: NotificationUnreadTypeBadgeCountWidget(
        child: Icon(mapTabToIconData(context, tab)), type: type,
      ),
    );
  }

  IconButton buildSettingsActionButton() => IconButton(
        icon: Icon(Icons.settings),
        color: Colors.white,
        onPressed: () {
          _drawerKey.currentState.openEndDrawer();
        },
      );

  IconData mapTabToIconData(BuildContext context, NotificationTab tab) {
    switch (tab) {
      case NotificationTab.all:
        return Icons.notifications_none;
        break;

      case NotificationTab.mentions:
        return Icons.alternate_email;
        break;
      case NotificationTab.reblogs:
        return Icons.repeat;
        break;
      case NotificationTab.favourites:
        return Icons.favorite_border;
        break;
      case NotificationTab.follows:
        return Icons.person_add;
        break;
    }

    throw "Invalid tab $tab";
  }

  Widget buildBodyWidget(BuildContext context) {
    var notificationsHomePageBloc =
        INotificationsHomeTabBloc.of(context, listen: true);
    _logger.finest(() => "buildBodyWidget");

    return TabBarView(
        children: List<Widget>.generate(
      tabs.length,
      (int index) {
        var tab = tabs[index];

        return buildTabBody(context, tab, notificationsHomePageBloc);
      },
    ));
  }

  Widget buildTabBody(BuildContext context, NotificationTab tab,
      INotificationsHomeTabBloc notificationsHomePageBloc) {
    MastodonNotificationType onlyWithType = mapTabToType(tab);

    return DisposableProvider<INotificationCachedListService>(
      create: (context) => NotificationCachedListService.createFromContext(
          context,
          onlyWithType: onlyWithType),
      child: DisposableProvider<
          IPaginationBloc<PaginationPage<INotification>, INotification>>(
        create: (context) =>
            NotificationCachedPaginationBloc.createFromContext(context),
        child: DisposableProvider<INotificationPaginationListBloc>(
          create: (context) =>
              NotificationPaginationListBloc.createFromContext(context),
          child: NotificationPaginationListWidget(
            needWatchLocalRepositoryForUpdates: true,
            key: PageStorageKey("${tab.toString()}"),
          ),
        ),
      ),
    );
  }

  MastodonNotificationType mapTabToType(NotificationTab tab) {
    MastodonNotificationType onlyWithType;
    
    switch (tab) {
      case NotificationTab.all:
        onlyWithType = null;
        break;
      case NotificationTab.mentions:
        onlyWithType = MastodonNotificationType.mention;
        break;
      case NotificationTab.reblogs:
        onlyWithType = MastodonNotificationType.reblog;
        break;
      case NotificationTab.favourites:
        onlyWithType = MastodonNotificationType.favourite;
        break;
      case NotificationTab.follows:
        onlyWithType = MastodonNotificationType.follow;
        break;
    }
    return onlyWithType;
  }
}
