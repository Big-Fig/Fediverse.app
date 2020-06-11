import 'package:easy_localization/easy_localization.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc_impl.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/notification/notification_tabs_model.dart';
import 'package:fedi/app/notification/pagination/cached/notification_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/notification/pagination/list/notification_pagination_list_widget.dart';
import 'package:fedi/app/notification/pagination/list/notification_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/notification/unread/notification_unread_exclude_types_badge_widget.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/timeline/timeline_post_status_header_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/app/ui/tab/fedi_icon_tab.dart';
import 'package:fedi/collapsible/collapsible_bloc.dart';
import 'package:fedi/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_container_with_overlay_widget.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/ui/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll_controller_bloc.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("timeline_tabs_widget.dart");

class NotificationTabsNewWidget extends StatefulWidget {
  final List<NotificationTab> tabs;
  final NotificationTab startTab;

  final List<Widget> appBarActionWidgets;

  NotificationTabsNewWidget({
    @required this.tabs,
    @required this.startTab,
    @required this.appBarActionWidgets,
  });

  @override
  _NotificationTabsNewWidgetState createState() =>
      _NotificationTabsNewWidgetState();
}

class _NotificationTabsNewWidgetState extends State<NotificationTabsNewWidget>
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
          ...tabs.map((tab) => NotificationUnreadBadgeExcludeTypesWidget(
                offset: 6.0,
                excludeTypes: mapTabToExcludeTypes(tab),
                child: FediIconTab(
                  mapTabToIconData(context, tab),
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
        INestedScrollControllerBloc.of(context, listen: false)
            .nestedScrollController;
    return NestedScrollView(
        controller: nestedScrollController,
        headerSliverBuilder: (BuildContext c, bool f) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.0 + MediaQuery.of(context).padding.top,
                      bottom: 8.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: FediLightStatusBarStyleArea(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
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
        body: Column(
          children: <Widget>[
            Expanded(
              child: NotificationTabsNestedScrollViewBodyWidget(
                  'Tab0', tabController, widget.tabs),
            )
          ],
        ));
  }
}

class NotificationTabsNestedScrollViewBodyWidget extends StatefulWidget {
  final List<NotificationTab> tabs;
  const NotificationTabsNestedScrollViewBodyWidget(
    this.tabKey,
    this.tabController,
    this.tabs,
  );

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

    return Expanded(
      child: Container(
        color: Colors.white,
        child: TabBarView(
          controller: widget.tabController,
          children: <Widget>[
            TabViewItem(Key(widget.tabKey + '0'), tabs[0]),
            TabViewItem(Key(widget.tabKey + '1'), tabs[0]),
            TabViewItem(Key(widget.tabKey + '2'), tabs[0]),
          ],
        ),
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

    List<PleromaNotificationType> excludeTypes = mapTabToExcludeTypes
      (widget.tab);

    return DisposableProvider<INotificationCachedListBloc>(
      create: (context) => NotificationCachedListBloc.createFromContext(context,
          excludeTypes: excludeTypes),
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
              child: PaginationListWithNewItemsContainerWithOverlayWidget(
                textBuilder: (context, updateItemsCount) => plural(
                    "app.notification.list.new_items.action"
                    ".tap_to_load_new",
                    updateItemsCount),
                child: DisposableProvider<ICollapsibleBloc>(
                  create: (context) =>
                      CollapsibleBloc.createFromContext(context),
                  child: Stack(
                    children: <Widget>[
                      Builder(
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

    return NestedScrollViewInnerScrollPositionKeyWidget(
      widget.tabKey,
      ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext c, int i) {
            return Container(
              //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
              alignment: Alignment.center,
              height: 60.0,
              width: double.infinity,
              //color: Colors.blue,
              child: Text(widget.tabKey.toString() + ': List$i'),
            );
          },
          itemCount: 100,
          padding: const EdgeInsets.all(0.0)),
    );
//
//    var notificationTabsBloc = INotificationTabsBloc.of(context, listen: false);
//
//    Widget child = Provider<
//        IPaginationListWithNewItemsBloc<PaginationPage<IStatus>,
//            IStatus>>.value(
//      value: notificationTabsBloc.retrieveNotificationTabPaginationListBloc(widget.tab),
//      child: ProxyProvider<
//          IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>,
//          IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
//        update: (context, value, previous) => value,
//        child: ProxyProvider<
//            IPaginationListWithNewItemsBloc<PaginationPage<IStatus>,
//                IStatus>,
//            IPaginationListWithNewItemsBloc>(
//            update: (context, value, previous) => value,
//            child: Stack(
//              children: <Widget>[
////               NestedScrollViewInnerScrollPositionKeyWidget(
////              widget.tabKey,
////              ListView.builder(
////                  physics: const ClampingScrollPhysics(),
////                  itemBuilder: (BuildContext c, int i) {
////                    return Container(
////                      //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
////                      alignment: Alignment.center,
////                      height: 60.0,
////                      width: double.infinity,
////                      //color: Colors.blue,
////                      child: Text("asd" + ': List$i'),
////                    );
////                  },
////                  itemCount: 100,
////                  padding: const EdgeInsets.all(0.0)),
////            ),
//                FediDarkStatusBarStyleArea(child: TimelineWidget(tabKey: widget.tabKey)),
//
//                Builder(
//                  builder: (context) {
//                    var scrollControllerBloc =
//                    IScrollControllerBloc.of(context, listen: false);
//                    var fediSliverAppBarBloc =
//                    IFediSliverAppBarBloc.of(context, listen: false);
//                    return StreamBuilder<bool>(
//                        stream: Rx.combineLatest2(
//                            scrollControllerBloc.longScrollDirectionStream,
//                            fediSliverAppBarBloc.isAtLeastStartExpandStream,
//                                (scrollDirection, isAtLeastStartExpand) {
//                              _logger
//                                  .finest(() => "scrollDirection $scrollDirection "
//                                  "$isAtLeastStartExpand");
//
//                              return scrollDirection == ScrollDirection.forward &&
//                                  isAtLeastStartExpand == false;
//                            }),
//                        builder: (context, snapshot) {
//                          var showCollapsedBody = snapshot.data;
//                          return Align(
//                              alignment: Alignment.topCenter,
//                              child: Padding(
//                                padding: EdgeInsets.only(
//                                    top: showCollapsedBody == true ? 24 : 48),
//                                child: PaginationListWithNewItemsOverlayWidget(
//                                  textBuilder: (context, updateItemsCount) =>
//                                      plural(
//                                          "app.status.list.new_items.action.tap_to_load_new",
//                                          updateItemsCount),
//                                ),
//                              ));
//                        });
//                  },
//                ),
//              ],
//            )),
//      ),
//    );
//
//     child = ListView.builder(
//        physics: const ClampingScrollPhysics(),
//        itemBuilder: (BuildContext c, int i) {
//          return Container(
//            //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
//            alignment: Alignment.center,
//            height: 60.0,
//            width: double.infinity,
//            //color: Colors.blue,
//            child: Text(widget.tabKey.toString() + ': List$i'),
//          );
//        },
//        itemCount: 100,
//        padding: const EdgeInsets.all(0.0));

//    child = SmartRefresher(
//      controller: RefreshController(),
//      enablePullDown: true,
//      enablePullUp: true,
//      header: const ListRefreshHeaderWidget(),
//      footer: const ListLoadingFooterWidget(),
//      child: child,
//    );

//    return child;
  }

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