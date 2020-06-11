import 'dart:async';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/list/list_loading_footer_widget.dart';
import 'package:fedi/app/list/list_refresh_header_widget.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_unread_badge_widget.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("timeline_tabs_widget.dart");

class TimelineNewWidget extends StatefulWidget {
  final List<TimelineTab> tabs;
  final TimelineTab startTab;
  аштфд

  TimelineNewWidget({
    @required this.tabs,
    @required this.startTab,
  });

  @override
  _TimelineNewWidgetState createState() => _TimelineNewWidgetState();
}

class _TimelineNewWidgetState extends State<TimelineNewWidget>
    with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(
        length: widget.tabs.length,
        vsync: this,
        initialIndex: widget.tabs.indexOf(widget.startTab));
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
      body: _buildScaffoldBody(),
    );
  }

  ClipRRect _buildExpandedAppBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      child: Container(
        color: FediColors.white,
        child: FediListTile(
          isFirstInList: true,
          child: TimelinePostStatusHeaderWidget(),
        ),
      ),
    );
  }


  GestureDetector _buildCollapsedAppBarBody(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        goToNewPostStatusPage(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            MyAccountAvatarWidget(
              imageSize: 40,
              progressSize: 24,
            ),
            SizedBox(
              width: 24.0,
            ),
            Text(
              tr("app.status.post.field.message.hint"),
              style: TextStyle(
                  fontSize: 18.0,
                  color: FediColors.lightGrey,
                  height: 1.5,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabBar(BuildContext context, List<TimelineTab> tabs,
      ITimelineTabsBloc timelineTabsBloc) =>
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...tabs
                          .map((tab) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Provider<
                            IPaginationListWithNewItemsBloc>.value(
                          value: timelineTabsBloc
                              .retrieveTimelineTabPaginationListBloc(
                              tab),
                          child:
                          PaginationListWithNewItemsUnreadBadgeWidget(
                            child: FediTextTab(
                              mapTabToTitle(context, tab),
                              index: tabs.indexOf(tab),
                              isTransparent: true,
                            ),
                          ),
                        ),
                      ))
                          .toList()
                    ],
                  ),
                ),
                Row(
                  children: [...appBarActionWidgets],
                )
              ],
            ),
          )
        ],
      );


  String mapTabToTitle(BuildContext context, TimelineTab tab) {
    switch (tab) {
      case TimelineTab.public:
        return tr("app.home.tab.timelines.tab.public");
        break;
      case TimelineTab.home:
        return tr("app.home.tab.timelines.tab.home");

        break;
      case TimelineTab.local:
        return tr("app.home.tab.timelines.tab.local");
        break;
    }

    throw "Invalid tab $tab";
  }

  Widget _buildScaffoldBody() {
    var timelinesTabsBloc = ITimelineTabsBloc.of(context, listen: true);

    _logger.finest(() => "build");

    return NestedScrollView(
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
                      child: buildTabBar(context, tabs, timelinesTabsBloc),
                    ),
                  ),
                  FediDarkStatusBarStyleArea(child: _buildExpandedAppBar()),
//              _buildCollapsedAppBarBody(context)
                ],
              ),
            ),
//              buildSliverAppBar(context, tabs, timelinesTabsBloc),
          ];
        },
        //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
        innerScrollPositionKeyBuilder: () {
          String index = 'Tab';
          index += tabController.index.toString();
          return Key(index);
        },
        body: Column(
          children: <Widget>[
            Expanded(
              child:
                  TimelineTabsNestedScrollViewBodyWidget('Tab', tabController),
            )
          ],
        ));
  }
}

class TimelineTabsNestedScrollViewBodyWidget extends StatefulWidget {
  const TimelineTabsNestedScrollViewBodyWidget(this.tabKey, this.tabController);

  final String tabKey;
  final TabController tabController;

  @override
  _TimelineTabsNestedScrollViewBodyWidgetState createState() =>
      _TimelineTabsNestedScrollViewBodyWidgetState();
}

class _TimelineTabsNestedScrollViewBodyWidgetState
    extends State<TimelineTabsNestedScrollViewBodyWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final TabBar secondaryTabBar = TabBar(
      controller: widget.tabController,
      labelColor: Colors.blue,
      indicatorColor: Colors.blue,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2.0,
      isScrollable: false,
      unselectedLabelColor: Colors.grey,
      tabs: <Tab>[
        Tab(text: widget.tabKey + '0'),
        Tab(text: widget.tabKey + '1'),
        Tab(text: widget.tabKey + '2'),
      ],
    );
    return Column(
      children: <Widget>[
        secondaryTabBar,
        Expanded(
          child: TabBarView(
            controller: widget.tabController,
            children: <Widget>[
              TabViewItem(Key(widget.tabKey + '0')),
              TabViewItem(Key(widget.tabKey + '1')),
              TabViewItem(Key(widget.tabKey + '2')),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TabViewItem extends StatefulWidget {
  const TabViewItem(this.tabKey);

  final Key tabKey;

  @override
  _TabViewItemState createState() => _TabViewItemState();
}

class _TabViewItemState extends State<TabViewItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget child = ListView.builder(
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
        padding: const EdgeInsets.all(0.0));

    child = SmartRefresher(
      controller: RefreshController(),
      enablePullDown: true,
      enablePullUp: true,
      header: const ListRefreshHeaderWidget(),
      footer: const ListLoadingFooterWidget(),
      child: child,
    );

    return NestedScrollViewInnerScrollPositionKeyWidget(widget.tabKey, child);
  }

  @override
  bool get wantKeepAlive => true;
}

class CommonSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  CommonSliverPersistentHeaderDelegate(this.child, this.height);

  final Widget child;
  final double height;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(CommonSliverPersistentHeaderDelegate oldDelegate) {
    //print('shouldRebuild---------------');
    return oldDelegate != this;
  }
}

Future<bool> onRefresh() {
  return Future<bool>.delayed(const Duration(seconds: 1), () {
    return true;
  });
}


