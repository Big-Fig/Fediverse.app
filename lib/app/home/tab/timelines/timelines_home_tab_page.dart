import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc.dart';
import 'package:fedi/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_widget.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_overlay_on_long_scroll_widget.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/new_timeline_widget.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_overlay_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class TimelinesHomeTabPage extends StatelessWidget {
  const TimelinesHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.transparent,
      endDrawer: DisposableProvider<ITimelinesHomeTabPageDrawerBloc>(
        create: (BuildContext context) => TimelinesHomeTabPageDrawerBloc(
            localPreferencesBloc:
                ITimelineLocalPreferencesBloc.of(context, listen: false)),
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
        nestedScrollControllerBloc: timelinesHomeTabBloc.nestedScrollControllerBloc,
        tabController: timelineTabsBloc.tabController,
      ),
      child: FediNestedScrollViewWithNestedScrollableTabsWidget(
        onLongScrollUpTopOverlayWidget:
            const TimelinesHomeTabOverlayOnLongScrollWidget(),
        topSliverWidgets: [
          FediTabMainHeaderBarWidget(
              leadingWidgets: null,
              content: _buildTabsWidget(),
              endingWidgets: _buildEndingWidgets(context)),
        ],
        topSliverScrollOffsetToShowWhiteStatusBar: null,
        tabKeyPrefix: "TimelineTab",
        tabBodyProviderBuilder:
            (BuildContext context, int index, Widget child) => Provider<
                IPaginationListWithNewItemsBloc<PaginationPage<IStatus>,
                    IStatus>>.value(
          value: timelineTabsBloc.retrieveTimelineTabPaginationListBloc(
              timelineTabsBloc.tabs[index]),
          child: ProxyProvider<
              IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>,
              IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
            update: (context, value, previous) => value,
            child: ProxyProvider<
                    IPaginationListWithNewItemsBloc<PaginationPage<IStatus>,
                        IStatus>,
                    IPaginationListWithNewItemsBloc>(
                update: (context, value, previous) => value, child: child),
          ),
        ),
        tabBodyContentBuilder: (BuildContext context) => NewTimelineWidget(),
        tabBodyOverlayBuilder: (BuildContext context) =>
            _buildTapToLoadOverlay(context),
      ),
    );
  }

  Widget _buildTapToLoadOverlay(BuildContext context) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: FediSizes.tapToLoadTopPadding),
          child: PaginationListWithNewItemsOverlayWidget(
            textBuilder: (context, updateItemsCount) => plural(
                "app.status.list.new_items.action.tap_to_load_new",
                updateItemsCount),
          ),
        ),
      );

  List<Widget> _buildEndingWidgets(BuildContext context) {
    return [
      buildSearchActionButton(context),
      SizedBox(
        width: 8.0,
      ),
      buildFilterActionButton()
    ];
  }

  Widget buildFilterActionButton() => FediIconInCircleTransparentButton(
        FediIcons.filter,
        onPressed: () {
          _drawerKey.currentState.openEndDrawer();
        },
      );

  Widget buildSearchActionButton(BuildContext context) =>
      FediIconInCircleTransparentButton(
        FediIcons.search,
        onPressed: () {
          goToSearchPage(context);
        },
      );

  Widget _buildTabsWidget() {
    return Row(
      children: [],
    );
  }
}
