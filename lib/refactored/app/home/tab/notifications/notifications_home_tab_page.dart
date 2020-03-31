import 'package:fedi/refactored/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc.dart';
import 'package:fedi/refactored/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc_impl.dart';
import 'package:fedi/refactored/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_widget.dart';
import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_model.dart';
import 'package:fedi/refactored/app/push/local_preferences/push_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/search/search_page.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
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

  NotificationsHomeTabPage({ Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationsHomePageBloc =
        INotificationsHomeTabBloc.of(context, listen: true);

    _logger.finest(() => "build");

    return Scaffold(
      key: _drawerKey,
      endDrawer: DisposableProvider<INotificationsHomeTabPageDrawerBloc>(
        create: (BuildContext context) => NotificationsHomeTabPageDrawerBloc(
            localPreferencesBloc:
                IPushLocalPreferencesBloc.of(context, listen: false)),
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
              buildSearchActionButton(context),
              buildSettingsActionButton(),
            ],
          )
        ],
      );

  Tab buildTab(BuildContext context, NotificationTab tab) => Tab(
        icon: Icon(mapTabToIconData(context, tab)),
      );

  IconButton buildSettingsActionButton() => IconButton(
        icon: Icon(Icons.settings),
        color: Colors.white,
        onPressed: () {
          _drawerKey.currentState.openEndDrawer();
        },
      );

  IconButton buildSearchActionButton(BuildContext context) => IconButton(
        icon: Icon(Icons.search),
        color: Colors.white,
        onPressed: () {
          goToSearchPage(context);
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
    _logger.finest(() => "new tab $tab");
    return Center(child: Text("$tab"));

//    return Provider(
//      create: (_) => notificationsHomePageBloc
//          .retrieveNotificationTabPaginationListBloc(tab),
//      child: NotificationWidget(
//        key: PageStorageKey(tab.toString()),
//      ),
//    );
  }
}
