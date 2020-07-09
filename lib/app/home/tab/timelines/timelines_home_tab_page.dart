import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_widget.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_overlay_on_long_scroll_widget.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_post_status_header_widget.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timelines_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timelines_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_text_tab_indicator_item_widget.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _timelineTabs = [
  TimelineTab.home,
  TimelineTab.local,
  TimelineTab.public,
];

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class TimelinesHomeTabPage extends StatefulWidget {
  const TimelinesHomeTabPage({Key key}) : super(key: key);

  @override
  _TimelinesHomeTabPageState createState() => _TimelinesHomeTabPageState();
}

class _TimelinesHomeTabPageState extends State<TimelinesHomeTabPage>
    with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: _timelineTabs.length,
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
      endDrawer: DisposableProvider<ITimelinesSettingsBloc>(
        create: (BuildContext context) => TimelinesSettingsBloc(
            localPreferencesBloc: ITimelineSettingsLocalPreferencesBloc.of(
                context,
                listen: false)),
        child: const TimelinesHomeTabPageDrawerWidget(),
      ),
      body: _buildBody(),
    );
  }

  DisposableProvider<ITimelineTabsBloc> _buildBody() {
    return DisposableProvider<ITimelineTabsBloc>(
      create: (BuildContext context) {
        var homeBloc = IHomeBloc.of(context, listen: false);
        var timelineTabsBloc =
            TimelineTabsBloc.createFromContext(context, TimelineTab.home);

        timelineTabsBloc.addDisposable(
            streamSubscription: timelineTabsBloc.tabsMap[TimelineTab.home]
                .paginationListWithNewItemsBloc.unmergedNewItemsCountStream
                .listen((unreadCount) {
          homeBloc
              .updateTimelinesUnread(unreadCount != null && unreadCount > 0);
        }));
        return timelineTabsBloc;
      },
      child: Builder(
        builder: (context) => _buildBodyWidget(context),
      ),
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    var timelineTabsBloc = ITimelineTabsBloc.of(context, listen: false);
    var timelinesHomeTabBloc = ITimelinesHomeTabBloc.of(context, listen: false);
    return DisposableProvider<
        IFediNestedScrollViewWithNestedScrollableTabsBloc>(
      create: (context) => FediNestedScrollViewWithNestedScrollableTabsBloc(
        nestedScrollControllerBloc:
            timelinesHomeTabBloc.nestedScrollControllerBloc,
        tabController: tabController,
      ),
      child: FediNestedScrollViewWithNestedScrollableTabsWidget(
        onLongScrollUpTopOverlayWidget:
            const TimelinesHomeTabOverlayOnLongScrollWidget(),
        topSliverWidgets: [
          FediTabMainHeaderBarWidget(
            leadingWidgets: null,
            content: _buildTabIndicatorWidget(),
            endingWidgets: _buildEndingWidgets(context),
          ),
          FediDarkStatusBarStyleArea(
            child: ClipRRect(
              borderRadius: FediBorderRadius.topOnlyDefaultBorderRadius,
              child: Container(
                color: FediColors.offWhite,
                child: FediListTile(
                  isFirstInList: true,
                  child: TimelinesHomeTabPostStatusHeaderWidget(),
                ),
              ),
            ),
          ),
        ],
        // white status bar over post status header
        topSliverScrollOffsetToShowWhiteStatusBar: 100,
        tabKeyPrefix: "TimelineTab",
        tabBodyProviderBuilder:
            (BuildContext context, int index, Widget child) => Provider<
                ICachedPaginationListWithNewItemsBloc<
                    CachedPaginationPage<IStatus>, IStatus>>.value(
          value: timelineTabsBloc.retrieveTimelineTabPaginationListBloc(
              timelineTabsBloc.tabs[index]),
          child: ProxyProvider<
              ICachedPaginationListWithNewItemsBloc<
                  CachedPaginationPage<IStatus>, IStatus>,
              IPaginationListBloc<CachedPaginationPage<IStatus>, IStatus>>(
            update: (context, value, previous) => value,
            child: ProxyProvider<
                    ICachedPaginationListWithNewItemsBloc<
                        CachedPaginationPage<IStatus>, IStatus>,
                    ICachedPaginationListWithNewItemsBloc>(
                update: (context, value, previous) => value, child: child),
          ),
        ),
        tabBodyContentBuilder: (BuildContext context) =>
            FediDarkStatusBarStyleArea(child: TimelineWidget()),
        tabBodyOverlayBuilder: (BuildContext context) =>
            StatusListTapToLoadOverlayWidget(),
        tabBarViewContainerBuilder: null,
      ),
    );
  }

  List<Widget> _buildEndingWidgets(BuildContext context) {
    return [
      buildSearchActionButton(context),
      const FediBigHorizontalSpacer(),
      buildFilterActionButton()
    ];
  }

  Widget buildFilterActionButton() => FediIconInCircleBlurredButton(
        FediIcons.filter,
        onPressed: () {
          _drawerKey.currentState.openEndDrawer();
        },
      );

  Widget buildSearchActionButton(BuildContext context) =>
      FediIconInCircleBlurredButton(
        FediIcons.search,
        onPressed: () {
          goToSearchPage(context);
        },
      );

  Widget _buildTabIndicatorWidget() => TimelineTabTextTabIndicatorItemWidget(
        tabController: tabController,
        timelineTabs: _timelineTabs,
      );
}
