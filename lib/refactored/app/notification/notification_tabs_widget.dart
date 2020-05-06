import 'package:fedi/refactored/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/refactored/app/notification/list/cached/notification_cached_list_bloc_impl.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/refactored/app/notification/notification_tabs_model.dart';
import 'package:fedi/refactored/app/notification/pagination/cached/notification_cached_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/notification/pagination/list/notification_pagination_list_widget.dart';
import 'package:fedi/refactored/app/notification/pagination/list/notification_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/refactored/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_header_widget.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("notification_tabs_widget.dart");

class NotificationTabsWidget extends StatelessWidget {
  final List<Widget> appBarActionWidgets;

  NotificationTabsWidget(
      {@required Key key, @required this.appBarActionWidgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationsTabsBloc =
        INotificationsTabsBloc.of(context, listen: false);
    var tabs = notificationsTabsBloc.tabs;
    return DefaultTabController(
      length: tabs.length,
      initialIndex: tabs.indexOf(notificationsTabsBloc.selectedTab),
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: buildTabBar(context, tabs, notificationsTabsBloc)),
          Expanded(child: buildBodyWidget(context)),
        ],
      ),
    );
  }

  Widget buildTabBar(BuildContext context, List<NotificationTab> tabs,
          INotificationsTabsBloc notificationsTabsBloc) =>
      Row(
        children: [
          Flexible(
            child: TabBar(
              tabs: tabs.map((tab) {
                return buildTab(context, tab);
              }).toList(),
              onTap: (index) {
                notificationsTabsBloc.selectTab(tabs[index]);
              },
            ),
          ),
          ...appBarActionWidgets
        ],
      );

  Tab buildTab(BuildContext context, NotificationTab tab) => Tab(
        icon: Icon(mapTabToIconData(context, tab)),
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
    var notificationsTabsBloc =
        INotificationsTabsBloc.of(context, listen: false);
    _logger.finest(() => "buildBodyWidget");

    var tabs = notificationsTabsBloc.tabs;

    return TabBarView(
        children: List<Widget>.generate(
      tabs.length,
      (int index) {
        var tab = tabs[index];

        return buildTabBody(context, tab, notificationsTabsBloc);
      },
    ));
  }

  Widget buildTabBody(BuildContext context, NotificationTab tab,
      INotificationsTabsBloc notificationsTabsBloc) {
    MastodonNotificationType onlyWithType = mapTabToType(tab);

    return DisposableProvider<INotificationCachedListBloc>(
      create: (context) => NotificationCachedListBloc.createFromContext(context,
          onlyWithType: onlyWithType),
      child: DisposableProvider<
          IPaginationBloc<PaginationPage<INotification>, INotification>>(
        create: (context) =>
            NotificationCachedPaginationBloc.createFromContext(context),
        child: DisposableProvider<
            IPaginationListWithNewItemsBloc<PaginationPage<INotification>,
                INotification>>(
          create: (context) => NotificationPaginationListWithNewItemsBloc(
              mergeNewItemsImmediately: false,
              paginationBloc: Provider.of(context, listen: false),
              cachedListService:
                  INotificationCachedListBloc.of(context, listen: false)),
          child: ProxyProvider<
              IPaginationListWithNewItemsBloc<PaginationPage<INotification>,
                  INotification>,
              IPaginationListBloc<PaginationPage<INotification>,
                  INotification>>(
            update: (context, value, previous) => value,
            child: ProxyProvider<
                IPaginationListWithNewItemsBloc<PaginationPage<INotification>,
                    INotification>,
                IPaginationListWithNewItemsBloc>(
              update: (context, value, previous) => value,
              child: PaginationListWithNewItemsHeaderWidget(
                child: DisposableProvider<ICollapsibleBloc>(
                  create: (context) =>
                      CollapsibleBloc.createFromContext(context),
                  child: Stack(
                    children: <Widget>[
                      NotificationPaginationListWidget(
                        needWatchLocalRepositoryForUpdates: true,
                        key: PageStorageKey("${tab.toString()}"),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ToggleCollapsibleOverlayWidget(),
                          ))
                    ],
                  ),
                ),
              ),
            ),
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
