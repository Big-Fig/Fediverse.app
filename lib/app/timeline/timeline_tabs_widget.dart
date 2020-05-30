import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/timeline_header_widget.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/home/fedi_home_tab_container_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_header_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("timeline_tabs_widget.dart");

class TimelineTabsWidget extends StatelessWidget {
  final List<Widget> appBarActionWidgets;

  TimelineTabsWidget({@required Key key, @required this.appBarActionWidgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesTabsBloc = ITimelineTabsBloc.of(context, listen: true);

    _logger.finest(() => "build");

    var tabs = timelinesTabsBloc.tabs;

    return DefaultTabController(
        length: tabs.length,
        initialIndex: tabs.indexOf(timelinesTabsBloc.selectedTab),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            var timelineHeaderHeight = 96;

            return <Widget>[
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: false,
                leading: SABT(
                  child: GestureDetector(
                    onTap: () {
                      goToNewPostStatusPage(context);
                    },
                    child: MyAccountAvatarWidget(
                      imageSize: 40,
                      progressSize: 24,
                    ),
                  ),
                ),
                title: SABT(
                  child: GestureDetector(
                    onTap: () {
                      goToNewPostStatusPage(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)
                          .tr("app.status.post.field.message.hint"),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: FediColors.lightGrey,
                          height: 1.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
//                backgroundColor: Colors.green,
                brightness: Brightness.light,
                expandedHeight: FediSizes.headerImageSingleRowSafeAreaHeight +
                    timelineHeaderHeight +
                    kToolbarHeight,
                backgroundColor: Colors.white,
                actions: [Container()],

                flexibleSpace: FlexibleSpaceBar(
//                  collapseMode: CollapseMode.pin,
//                  background: Image.asset('assets/forest.jpg', fit: BoxFit.cover),
                    background: Semantics(
                  container: true,
                  child: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.light,
                    child: FediHomeTabContainer(
                        topHeaderHeightInSafeArea:
                            FediSizes.headerImageSingleRowSafeAreaHeight,
                        topBar: buildTabBar(context, tabs, timelinesTabsBloc),
                        body: FediListTile(
                          isFirstInList: true,
                          child: TimelineHeaderWidget(),
                        )),
                  ),
                )),
              )

//              buildTabBar(context, tabs, timelinesTabsBloc)
//              SliverOverlapAbsorber(
//                // This widget takes the overlapping behavior of the SliverAppBar,
//                // and redirects it to the SliverOverlapInjector below. If it is
//                // missing, then it is possible for the nested "inner" scroll view
//                // below to end up under the SliverAppBar even when the inner
//                // scroll view thinks it has not been scrolled.
//                // This is not necessary if the "headerSliverBuilder" only builds
//                // widgets that do not overlap the next sliver.
//                handle:
//                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                sliver:
//
//
//                SliverAppBar(
//                  title: const Text('Books'),
//                  // This is the title in the app bar.
//                  pinned: true,
//                  expandedHeight: 150.0,
//                  // The "forceElevated" property causes the SliverAppBar to show
//                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
//                  // inner scroll view is scrolled beyond its "zero" point, i.e.
//                  // when it appears to be scrolled below the SliverAppBar.
//                  // Without this, there are cases where the shadow would appear
//                  // or not appear inappropriately, because the SliverAppBar is
//                  // not actually aware of the precise position of the inner
//                  // scroll views.
//                  forceElevated: innerBoxIsScrolled,
//                  bottom: TabBar(
//                    // These are the widgets to put in each tab in the tab bar.
//                    tabs: timelinesTabsBloc.tabs.map((TimelineTab tab) => Tab
//                      (text: tab.toString())).toList(),
//                  ),
//                ),
//              ),
            ];
          },
          body: Builder(
            // This Builder is needed to provide a BuildContext that is
            // "inside" the NestedScrollView, so that
            // sliverOverlapAbsorberHandleFor() can find the
            // NestedScrollView.
            builder: (BuildContext context) {
              return Semantics(
                  container: true,
                  child: AnnotatedRegion<SystemUiOverlayStyle>(
                      value: SystemUiOverlayStyle.dark,
                      child: buildBodyWidget(context)));
              return FediHomeTabContainer(
                topHeaderHeightInSafeArea:
                    FediSizes.headerImageSingleRowSafeAreaHeight,
                topBar: buildTabBar(context, tabs, timelinesTabsBloc),
                body: buildBodyWidget(context),
              );
//              return CustomScrollView(
//                // The "controller" and "primary" members should be left
//                // unset, so that the NestedScrollView can control this
//                // inner scroll view.
//                // If the "controller" property is set, then this scroll
//                // view will not be associated with the NestedScrollView.
//                // The PageStorageKey should be unique to this ScrollView;
//                // it allows the list to remember its scroll position when
//                // the tab view is not on the screen.
//                key: PageStorageKey<String>("name"),
//                slivers: <Widget>[
//                  SliverOverlapInjector(
//                    // This is the flip side of the SliverOverlapAbsorber
//                    // above.
//                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
//                        context),
//                  ),
//                  SliverPadding(
//                    padding: const EdgeInsets.all(8.0),
//                    // In this example, the inner scroll view has
//                    // fixed-height list items, hence the use of
//                    // SliverFixedExtentList. However, one could use any
//                    // sliver widget here, e.g. SliverList or SliverGrid.
//                    sliver: SliverFixedExtentList(
//                      // The items in this example are fixed to 48 pixels
//                      // high. This matches the Material Design spec for
//                      // ListTile widgets.
//                      itemExtent: 48.0,
//                      delegate: SliverChildBuilderDelegate(
//                        (BuildContext context, int index) {
//                          // This builder is called for each child.
//                          // In this example, we just number each list item.
//                          return ListTile(
//                            title: Text('Item $index'),
//                          );
//                        },
//                        // The childCount of the SliverChildBuilderDelegate
//                        // specifies how many children this inner list
//                        // has. In this example, each tab has a list of
//                        // exactly 30 items, but this is arbitrary.
//                        childCount: 30,
//                      ),
//                    ),
//                  ),
//                ],
//              );
            },

//            child: FediHomeTabContainer(
//              topHeaderHeightInSafeArea:
//                  FediSizes.headerImageSingleRowSafeAreaHeight,
//              topBar: buildTabBar(context, tabs, timelinesTabsBloc),
//              body: buildBodyWidget(context),
//            ),
          ),
        ));
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
                ...tabs
                    .map((tab) => FediTextTab(
                          mapTabToTitle(context, tab),
                          index: tabs.indexOf(tab),
                          isTransparent: true,
                        ))
                    .toList(),
                ...appBarActionWidgets
              ],
            ),
          )
        ],
      );

  Tab buildTab(BuildContext context, TimelineTab tab) =>
      Tab(text: mapTabToTitle(context, tab));

  String mapTabToTitle(BuildContext context, TimelineTab tab) {
    var appLocalizations = AppLocalizations.of(context);

    switch (tab) {
      case TimelineTab.public:
        return appLocalizations.tr("app.home.tab.timelines.tab.public");
        break;
      case TimelineTab.home:
        return appLocalizations.tr("app.home.tab.timelines.tab.home");

        break;
      case TimelineTab.local:
        return appLocalizations.tr("app.home.tab.timelines.tab.local");
        break;
    }

    throw "Invalid tab $tab";
  }

  Widget buildBodyWidget(BuildContext context) {
    var timelineTabsBloc = ITimelineTabsBloc.of(context, listen: true);
    _logger.finest(() => "buildBodyWidget");
    var tabs = timelineTabsBloc.tabs;
    return TabBarView(
        children: List<Widget>.generate(
      tabs.length,
      (int index) {
        var tab = tabs[index];

        return buildTabBody(context, tab, timelineTabsBloc);
      },
    ));
  }

  Widget buildTabBody(BuildContext context, TimelineTab tab,
      ITimelineTabsBloc timelineTabsBloc) {
    _logger.finest(() => "new tab $tab");

    return Provider<
        IPaginationListWithNewItemsBloc<PaginationPage<IStatus>,
            IStatus>>.value(
      value: timelineTabsBloc.retrieveTimelineTabPaginationListBloc(tab),
      child: ProxyProvider<
          IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>,
          IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<
            IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>,
            IPaginationListWithNewItemsBloc>(
          update: (context, value, previous) => value,
          child: PaginationListWithNewItemsHeaderWidget(
            textBuilder: (context, updateItemsCount) =>
                AppLocalizations.of(context).tr(
                    "app.status.list.new_items.action.tap_to_load_new",
                    args: [updateItemsCount.toString()]),
            child: TimelineWidget(),
          ),
        ),
      ),
    );
  }
}

class SABT extends StatefulWidget {
  final Widget child;

  const SABT({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _SABTState createState() {
    return new _SABTState();
  }
}

class _SABTState extends State<SABT> {
  ScrollPosition _position;
  bool _visible;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings settings =
        context.inheritFromWidgetOfExactType(FlexibleSpaceBarSettings);
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: widget.child,
    );
  }
}
