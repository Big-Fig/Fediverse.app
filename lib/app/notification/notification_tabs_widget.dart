import 'package:easy_localization/easy_localization.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc_impl.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/notification/notification_tabs_model.dart';
import 'package:fedi/app/notification/pagination/cached/notification_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/notification/pagination/list/notification_pagination_list_widget.dart';
import 'package:fedi/app/notification/pagination/list/notification_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/notification/unread/notification_unread_exclude_types_badge_widget.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/app/ui/tab/fedi_icon_tab_indicator_item_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_overlay_widget.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';
import 'package:provider/provider.dart';

var _logger = Logger("timeline_tabs_widget.dart");

class NotificationTabsWidget extends StatefulWidget {
  final List<NotificationTab> tabs;
  final NotificationTab startTab;

  final List<Widget> appBarActionWidgets;

  NotificationTabsWidget({
    @required this.tabs,
    @required this.startTab,
    @required this.appBarActionWidgets,
  });

  @override
  _NotificationTabsWidgetState createState() => _NotificationTabsWidgetState();
}

class _NotificationTabsWidgetState extends State<NotificationTabsWidget>
    with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: widget.tabs.length, vsync: this,
//      initialIndex: widget.tabs.indexOf(widget.startTab),
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildScaffoldBody(),
    );
  }

  Widget buildTabBar(BuildContext context, List<NotificationTab> tabs,
      INotificationTabsBloc notificationsTabsBloc) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...tabs.map((tab) =>
              NotificationUnreadBadgeExcludeTypesWidget(
                offset: 6.0,
                excludeTypes: mapTabToExcludeTypes(tab),
                child: FediIconTabIndicatorItemWidget(
                  iconData: mapTabToIconData(context, tab),
                  index: tabs.indexOf(tab),
                  tabController: tabController,
                ),
              )),
          ...widget.appBarActionWidgets
        ],
      );

  IconData mapTabToIconData(BuildContext context, NotificationTab tab) {
    switch (tab) {
      case NotificationTab.all:
        return FediIcons.notification;
        break;
      case NotificationTab.mentions:
        return FediIcons.chat;
        break;
      case NotificationTab.reblogs:
        return FediIcons.reply;
        break;
      case NotificationTab.favourites:
        return FediIcons.heart;
        break;
      case NotificationTab.follows:
        return FediIcons.add_user;
        break;
    }

    throw "Invalid tab $tab";
  }

  Widget _buildScaffoldBody() {
    var timelinesTabsBloc = INotificationTabsBloc.of(context, listen: true);

    _logger.finest(() => "build");

    var nestedScrollController =
        INestedScrollControllerBloc
            .of(context, listen: false)
            .nestedScrollController;

    var fediNestedScrollViewBloc = IFediNestedScrollViewBloc.of(context);
    return Stack(
      children: [
        _buildNestedScrollView(nestedScrollController, timelinesTabsBloc),
        StreamBuilder<bool>(
            stream: fediNestedScrollViewBloc.isNestedScrollViewBodyStartScrollStream,
            builder: (context, snapshot) {
              var isAtLeastStartExpand = snapshot.data;
              if (isAtLeastStartExpand == false) {
                return Container(
                    height: MediaQuery
                        .of(context)
                        .padding
                        .top,
                    color: Colors.white);
              } else {
                return SizedBox.shrink();
              }
            })
      ],
    );
  }

  NestedScrollView _buildNestedScrollView(
      NestedScrollController nestedScrollController,
      INotificationTabsBloc timelinesTabsBloc) {
    return NestedScrollView(
        controller: nestedScrollController,
        headerSliverBuilder: (BuildContext c, bool f) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.0 + MediaQuery
                          .of(context)
                          .padding
                          .top,
                      bottom: 8.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: FediLightStatusBarStyleArea(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                        child: buildTabBar(
                            context, widget.tabs, timelinesTabsBloc),
                      ),
                    ),
                  ),
//              _buildCollapsedAppBarBody(context)
                ],
              ),
            ),
//              buildSliverAppBar(context, tabs, timelinesTabsBloc),
          ];
        },
        //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
        innerScrollPositionKeyBuilder: () {
          String index = 'Tab0';
          index += tabController.index.toString();
          return Key(index);
        },
        body: Builder(
            builder: (context) {
              nestedScrollController.enableScroll(context);

              return Column(
                children: <Widget>[
                  Expanded(
                    child: NotificationTabsNestedScrollViewBodyWidget(
                        'Tab0', tabController, widget.tabs),
                  )
                ],
              );
            }
        ));
  }
}

class NotificationTabsNestedScrollViewBodyWidget extends StatefulWidget {
  final List<NotificationTab> tabs;

  const NotificationTabsNestedScrollViewBodyWidget(this.tabKey,
      this.tabController,
      this.tabs,);

  final String tabKey;
  final TabController tabController;

  @override
  _NotificationTabsNestedScrollViewBodyWidgetState createState() =>
      _NotificationTabsNestedScrollViewBodyWidgetState();
}

class _NotificationTabsNestedScrollViewBodyWidgetState
    extends State<NotificationTabsNestedScrollViewBodyWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var notificationTabsBloc = INotificationTabsBloc.of(context, listen: true);
    _logger.finest(() => "buildBodyWidget");
    var tabs = notificationTabsBloc.tabs;

    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      child: Container(
        color: Colors.white,
        child: TabBarView(
            controller: widget.tabController,
            children: List<Widget>.generate(
              tabs.length,
                  (int index) {
                var tab = tabs[index];

                return TabViewItem(Key(widget.tabKey + index.toString()), tab);

//              return buildTabBody(context, tab, notificationTabsBloc);
              },
            )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TabViewItem extends StatefulWidget {
  final NotificationTab tab;

  const TabViewItem(this.tabKey, this.tab);

  final Key tabKey;

  @override
  _TabViewItemState createState() => _TabViewItemState();
}

class _TabViewItemState extends State<TabViewItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    List<PleromaNotificationType> excludeTypes =
    mapTabToExcludeTypes(widget.tab);

    return DisposableProvider<INotificationCachedListBloc>(
      create: (context) =>
          NotificationCachedListBloc.createFromContext(context,
              excludeTypes: excludeTypes),
      child: DisposableProvider<
          IPaginationBloc<PaginationPage<INotification>, INotification>>(
        create: (context) =>
            NotificationCachedPaginationBloc.createFromContext(context),
        child: DisposableProvider<
            IPaginationListWithNewItemsBloc<PaginationPage<INotification>,
                INotification>>(
          create: (context) =>
              NotificationPaginationListWithNewItemsBloc(
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
              child: Stack(
                children: <Widget>[
                  _buildList(),
                  _buildOverlayNewItems(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Builder _buildList() {
    return Builder(
      builder: (context) =>
          NestedScrollViewInnerScrollPositionKeyWidget(
            widget.tabKey,
            FediDarkStatusBarStyleArea(
              child: NotificationPaginationListWidget(
                needWatchLocalRepositoryForUpdates: true,
//                              key: PageStorageKey("${tab.toString()}"),
              ),
            ),
          ),
    );
  }

  Builder _buildOverlayNewItems(BuildContext context) =>
      Builder(
        builder: (context) {
          var fediNestedScrollViewBloc =
          IFediNestedScrollViewBloc.of(context, listen: false);
          return StreamBuilder<bool>(
              stream:
              fediNestedScrollViewBloc.isNestedScrollViewBodyStartScrollStream,
              builder: (context, snapshot) {
                var isAtLeastStartExpand = snapshot.data;
                var topPadding = isAtLeastStartExpand == true
                    ? 24.0
                    : 24.0 + MediaQuery
                    .of(context)
                    .padding
                    .top;

                _logger.finest(() => "topPadding $topPadding");

//
//                            topPadding =
//                                24.0 + MediaQuery.of(context).padding.top;
//                                24.0;
                return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: topPadding),
                      child:
                      PaginationListWithNewItemsOverlayWidget(
                        textBuilder: (context, updateItemsCount) =>
                            plural(
                                "app.notification.list.new_items"
                                    ".action.tap_to_load_new",
                                updateItemsCount),
                      ),
                    ));
              });
        },
      );

  @override
  bool get wantKeepAlive => true;
}

List<PleromaNotificationType> mapTabToExcludeTypes(NotificationTab tab) {
  List<PleromaNotificationType> excludeTypes;

  switch (tab) {
    case NotificationTab.all:
      excludeTypes = pleromaNotificationTypeValues
          .valuesWithExclude([PleromaNotificationType.pleromaChatMention]);
      break;
    case NotificationTab.mentions:
      excludeTypes = pleromaNotificationTypeValues
          .valuesWithExcept([PleromaNotificationType.mention]);
      break;
    case NotificationTab.reblogs:
      excludeTypes = pleromaNotificationTypeValues
          .valuesWithExcept([PleromaNotificationType.reblog]);
      break;
    case NotificationTab.favourites:
      excludeTypes = pleromaNotificationTypeValues
          .valuesWithExcept([PleromaNotificationType.favourite]);
      break;
    case NotificationTab.follows:
      excludeTypes = pleromaNotificationTypeValues.valuesWithExcept([
        PleromaNotificationType.follow,
        PleromaNotificationType.followRequest,
      ]);
      break;
  }
  return excludeTypes;
}
