import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_widget.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc_impl.dart';
import 'package:fedi/app/notification/list/notification_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/notification/notification_tabs_bloc_impl.dart';
import 'package:fedi/app/notification/pagination/cached/notification_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/notification/pagination/list/notification_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/notification/pagination/list/notification_pagination_list_widget.dart';
import 'package:fedi/app/notification/tab/notification_tab_exclude_helper.dart';
import 'package:fedi/app/notification/tab/notification_tab_icon_tab_indicator_item_widget.dart';
import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _notificationTabs = [
  NotificationTab.all,
  NotificationTab.mentions,
  NotificationTab.reblogs,
  NotificationTab.favourites,
  NotificationTab.follows,
];

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class NotificationsHomeTabPage extends StatefulWidget {
  const NotificationsHomeTabPage({Key key}) : super(key: key);

  @override
  _NotificationsHomeTabPageState createState() =>
      _NotificationsHomeTabPageState();
}

class _NotificationsHomeTabPageState extends State<NotificationsHomeTabPage>
    with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: _notificationTabs.length,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.transparent,
      endDrawer: const NotificationsHomeTabPageDrawerWidget(),
      body: _buildBody(),
    );
  }

  DisposableProvider<INotificationTabsBloc> _buildBody() {
    return DisposableProvider<INotificationTabsBloc>(
      create: (context) => NotificationsTabsBloc.createFromContext(context),
      child: Builder(
        builder: (context) => _buildBodyWidget(context),
      ),
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    var notificationsHomeTabBloc =
        INotificationsHomeTabBloc.of(context, listen: false);
    return DisposableProvider<
        IFediNestedScrollViewWithNestedScrollableTabsBloc>(
      create: (context) => FediNestedScrollViewWithNestedScrollableTabsBloc(
        nestedScrollControllerBloc:
            notificationsHomeTabBloc.nestedScrollControllerBloc,
        tabController: tabController,
      ),
      child: FediNestedScrollViewWithNestedScrollableTabsWidget(
        onLongScrollUpTopOverlayWidget: null,
        topSliverWidgets: [
          FediTabMainHeaderBarWidget(
            leadingWidgets: null,
            content: _buildTabIndicatorWidget(),
            endingWidgets: _buildEndingWidgets(context),
          ),
        ],
        topSliverScrollOffsetToShowWhiteStatusBar: null,
        tabKeyPrefix: "NotificationTab",
        tabBodyProviderBuilder:
            (BuildContext context, int index, Widget child) {
          var tab = _notificationTabs[index];

          return _buildTabBodyProvider(context, tab, child);
        },
        tabBodyContentBuilder: (BuildContext context) =>
            FediDarkStatusBarStyleArea(
          child: NotificationPaginationListWidget(
            needWatchLocalRepositoryForUpdates: true,
          ),
        ),
        tabBodyOverlayBuilder: (BuildContext context) =>
            NotificationListTapToLoadOverlayWidget(),
        tabBarViewContainerBuilder: (BuildContext context, Widget child) {
          return ClipRRect(
            borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
            child: Container(
              color: FediColors.white,
              child: child,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabBodyProvider(
      BuildContext context, NotificationTab tab, Widget child) {
    var timelineTabPaginationListBloc =
        INotificationTabsBloc.of(context, listen: false)
            .retrieveTimelineTabPaginationListBloc(tab);

    return Provider<
        ICachedPaginationListWithNewItemsBloc<
            CachedPaginationPage<INotification>, INotification>>.value(
      value: timelineTabPaginationListBloc,
      child: ProxyProvider<
          ICachedPaginationListWithNewItemsBloc<
              CachedPaginationPage<INotification>, INotification>,
          ICachedPaginationListWithNewItemsBloc>(
        update: (context, value, previous) => value,
        child: CachedPaginationListWithNewItemsBlocProxyProvider<
            CachedPaginationPage<INotification>, INotification>(child: child),
      ),
    );
  }

  List<Widget> _buildEndingWidgets(BuildContext context) {
    return [buildFilterActionButton()];
  }

  Widget buildFilterActionButton() => FediIconInCircleBlurredButton(
        FediIcons.filter,
        onPressed: () {
          _drawerKey.currentState.openEndDrawer();
        },
      );

  Widget _buildTabIndicatorWidget() =>
      NotificationTabTextTabIndicatorItemWidget(
        tabController: tabController,
        notificationTabs: _notificationTabs,
      );
}
