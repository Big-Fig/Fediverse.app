import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_overlay_on_long_scroll_widget.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_post_status_header_widget.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/timelines_settings_page.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_text_tab_indicator_item_widget.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:fedi/app/ui/button/fedi_transparent_icon_text_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

const _timelineTabs = [
  TimelineTab.home,
  TimelineTab.local,
  TimelineTab.public,
];

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
      backgroundColor: Colors.transparent,
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
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: FediPadding.horizontalSmallPadding,
                  child: Row(
                    children: [
                      Expanded(child: buildSearchActionButton(context)),
                      FediBigHorizontalSpacer(),
                      buildFilterActionButton()
                    ],
                  ),
                ),
                FediBigVerticalSpacer(),
                _buildTabIndicatorWidget(),
              ],
            ),
            endingWidgets: null,
          ),
          FediDarkStatusBarStyleArea(
            child: ClipRRect(
              borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
              child: Container(
                color: FediColors.offWhite,
                child: FediListTile(
                  isFirstInList: true,
                  child: TimelinesHomeTabPostStatusHeaderWidget(),
                  // special hack to avoid 1px horizontal line on some devices
                  oneSidePadding: FediSizes.smallPadding - 1,
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
          child: CachedPaginationListWithNewItemsBlocProxyProvider<
              CachedPaginationPage<IStatus>, IStatus>(child: child),
        ),
        tabBodyContentBuilder: (BuildContext context) =>
            FediDarkStatusBarStyleArea(child: TimelineWidget()),
        tabBodyOverlayBuilder: (BuildContext context) =>
            StatusListTapToLoadOverlayWidget(),
        tabBarViewContainerBuilder: null,
      ),
    );
  }

  Widget buildFilterActionButton() => FediIconInCircleBlurredButton(
        FediIcons.filter,
        onPressed: () {
          goTimelinesSettingsPage(context);
        },
      );

  Widget buildSearchActionButton(BuildContext context) =>
      FediTransparentIconTextButton(
        "app.search.title".tr(),
        FediIcons.search,
        onPressed: () {
          goToSearchPage(context);
        },
        height: FediSizes.iconInCircleDefaultSize,
      );

  Widget _buildTabIndicatorWidget() => Padding(
        padding: const EdgeInsets.only(top: 3.0, right: FediSizes.bigPadding),
        child: TimelineTabTextTabIndicatorItemWidget(
          tabController: tabController,
          timelineTabs: _timelineTabs,
        ),
      );
}
