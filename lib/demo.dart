import 'dart:async';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'app/list/list_loading_footer_widget.dart';
import 'app/list/list_refresh_header_widget.dart';

var _logger = Logger("timeline_tabs_widget.dart");

class OldExtendedNestedScrollViewDemo extends StatefulWidget {
  @override
  _OldExtendedNestedScrollViewDemoState createState() =>
      _OldExtendedNestedScrollViewDemoState();
}

class _OldExtendedNestedScrollViewDemoState
    extends State<OldExtendedNestedScrollViewDemo>
    with TickerProviderStateMixin {
  TabController secondaryTC;

  @override
  void initState() {
    secondaryTC = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    secondaryTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScaffoldBody(),
    );
  }

  Widget _buildScaffoldBody() {
    var timelinesTabsBloc = ITimelineTabsBloc.of(context, listen: true);

    _logger.finest(() => "build");

    var tabs = timelinesTabsBloc.tabs;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight = //statusBar height
        statusBarHeight + //pinned SliverAppBar height in header
            kToolbarHeight;
    return NestedScrollView(
        headerSliverBuilder: (BuildContext c, bool f) {
          return buildSliverHeader();
        },
        //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
        pinnedHeaderSliverHeightBuilder: () {
          return pinnedHeaderHeight;
        },
        //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
        innerScrollPositionKeyBuilder: () {
          String index = 'Tab';
          index += secondaryTC.index.toString();
          return Key(index);
        },
        body: Column(
          children: <Widget>[
            Expanded(
              child: SecondaryTabView('Tab', secondaryTC, true),
            )
          ],
        ));
  }
}

class SecondaryTabView extends StatefulWidget {
  const SecondaryTabView(this.tabKey, this.tc, this.oldDemo);

  final String tabKey;
  final TabController tc;
  final bool oldDemo;
  @override
  _SecondaryTabViewState createState() => _SecondaryTabViewState();
}

class _SecondaryTabViewState extends State<SecondaryTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final TabBar secondaryTabBar = TabBar(
      controller: widget.tc,
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
            controller: widget.tc,
            children: <Widget>[
              TabViewItem(Key(widget.tabKey + '0'), widget.oldDemo),
              TabViewItem(Key(widget.tabKey + '1'), widget.oldDemo),
              TabViewItem(Key(widget.tabKey + '2'), widget.oldDemo),
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
  const TabViewItem(this.tabKey, this.oldDemo);

  final Key tabKey;
  final bool oldDemo;
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

    if (widget.oldDemo) {
      return NestedScrollViewInnerScrollPositionKeyWidget(widget.tabKey, child);
    }

    /// new one doesn't need NestedScrollViewInnerScrollPositionKeyWidget any more. else {
    return child;
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

List<Widget> buildSliverHeader() {
  final List<Widget> widgets = <Widget>[];

  widgets.add(SliverAppBar(
      pinned: true,
      expandedHeight: 200.0,
      //title: Text(old ? 'old demo' : 'new demo'),
      flexibleSpace: FlexibleSpaceBar(
          //centerTitle: true,
          collapseMode: CollapseMode.pin,
          background: Image.asset(
            'assets/467141054.jpg',
            fit: BoxFit.fill,
          ))));

  return widgets;
}
