import 'dart:async';

import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_page.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_overlay_on_long_scroll_widget.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_post_status_header_widget.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/create/create_timeline_page.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_model.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_text_tab_indicator_item_widget.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:fedi/app/ui/button/fedi_transparent_icon_text_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger("timelines_home_tab_page.dart");

class TimelinesHomeTabPage extends StatefulWidget {
  @override
  _TimelinesHomeTabPageState createState() => _TimelinesHomeTabPageState();
}

class _TimelinesHomeTabPageState extends State<TimelinesHomeTabPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    return DisposableProvider<ITimelineTabListBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var timelineTabListBloc = TimelineTabListBloc.createFromContext(
          context,
          vsync: this,
        );

        _logger.finest(() => "create timelineTabListBloc");

        StreamSubscription listener;
        timelineTabListBloc.performAsyncInit();
        timelineTabListBloc.addDisposable(streamSubscription:
            timelineTabListBloc.mainTimelineTabBlocStream
                .listen((mainTimelineTabBloc) {
          if (mainTimelineTabBloc != null) {
            if (listener != null) {
              listener.cancel();
            }

            listener = mainTimelineTabBloc
                .paginationListWithNewItemsBloc.unmergedNewItemsCountStream
                .listen((unreadCount) {
              homeBloc.updateTimelinesUnread(
                  unreadCount != null && unreadCount > 0);
            });
            timelineTabListBloc.addDisposable(streamSubscription: listener);
          }
        }));

        return timelineTabListBloc;
      },
      child: Builder(
        builder: (context) => StreamBuilder<TimelineTabBlocsList>(
            stream: ITimelineTabListBloc.of(context, listen: false)
                .timelineTabBlocsListStream,
            builder: (context, snapshot) {
              var timelineTabBlocsList = snapshot.data;

              _logger.finest(() =>
                  "StreamBuilder timelineTabBlocsList $timelineTabBlocsList");
              return Provider<TimelineTabBlocsList>.value(
                value: timelineTabBlocsList,
                child: TimelinesHomeTabPageBody(),
              );
            }),
      ),
    );
  }
}

class TimelinesHomeTabPageBody extends StatelessWidget {
  TimelinesHomeTabPageBody() {
    _logger.finest(() => "TimelinesHomeTabPageBody constructor");
  }

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return Scaffold(
      backgroundColor: fediUiColorTheme.transparent,
      body: _buildBodyWidget(context),
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    var timelinesHomeTabBloc = ITimelinesHomeTabBloc.of(context, listen: false);

    var timelineTabBlocsList =
        Provider.of<TimelineTabBlocsList>(context, listen: true);

    return DisposableProxyProvider<TimelineTabBlocsList,
        IFediNestedScrollViewWithNestedScrollableTabsBloc>(
      update: (context, value, previous) {
        _logger.finest(
            () => "IFediNestedScrollViewWithNestedScrollableTabsBloc update");

        return FediNestedScrollViewWithNestedScrollableTabsBloc(
          nestedScrollControllerBloc:
              timelinesHomeTabBloc.nestedScrollControllerBloc,
          tabController: value?.tabController,
        );
      },
      child: FediNestedScrollViewWithNestedScrollableTabsWidget(
        tabsEmptyBuilder: (context) => _buildLoading(context),
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
                      buildFilterActionButton(context)
                    ],
                  ),
                ),
                FediBigVerticalSpacer(),
                Row(
                  children: [
                    Expanded(
                      child: _buildTabIndicatorWidget(
                          context, timelineTabBlocsList),
                    ),
                    Padding(
                      padding: FediPadding.horizontalSmallPadding,
                      child: buildAddTimelineActionButton(context),
                    ),
                  ],
                ),
              ],
            ),
            endingWidgets: null,
          ),
          FediDarkStatusBarStyleArea(
            child: ClipRRect(
              borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
              child: Container(
                color: IFediUiColorTheme.of(context).offWhite,
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
            (BuildContext context, int index, Widget child) {
          var timelineTabListBloc =
              ITimelineTabListBloc.of(context, listen: false);
          var tabBloc =
              timelineTabListBloc.timelineTabBlocsList.timelineTabBlocs[index];

          _logger.finest(() => "tabBodyProviderBuilder index ${index} "
              "tabBloc ${tabBloc.timelineId}");

          // return Provider<ITimelineTabBloc>.value(
          //   value: tabBloc,
          //   child: Provider<ITimelineLocalPreferencesBloc>.value(
          //     value: tabBloc.timelineLocalPreferencesBloc,
          //     child: Provider<
          //         ICachedPaginationListWithNewItemsBloc<
          //             CachedPaginationPage<IStatus>, IStatus>>.value(
          //       value: tabBloc.paginationListWithNewItemsBloc,
          //       child: CachedPaginationListWithNewItemsBlocProxyProvider<
          //           CachedPaginationPage<IStatus>, IStatus>(child: child),
          //     ),
          //   ),
          // );

          return Provider<ITimelineTabBloc>.value(
            value: tabBloc,
            child:
                ProxyProvider<ITimelineTabBloc, ITimelineLocalPreferencesBloc>(
              update: (context, value, previous) =>
                  value.timelineLocalPreferencesBloc,
              // value: tabBloc.timelineLocalPreferencesBloc,
              child: ProxyProvider<
                  ITimelineTabBloc,
                  ICachedPaginationListWithNewItemsBloc<
                      CachedPaginationPage<IStatus>, IStatus>>(
                // value: tabBloc.paginationListWithNewItemsBloc,
                update: (context, value, previous) =>
                    value.paginationListWithNewItemsBloc,
                child: CachedPaginationListWithNewItemsBlocProxyProvider<
                    CachedPaginationPage<IStatus>, IStatus>(child: child),
              ),
            ),
          );
        },
        tabBodyContentBuilder: (BuildContext context, int index) {
          // var tabBloc = timelineTabBlocs[index];

          _logger.finest(() => "tabBodyContentBuilder index $index");

          return FediDarkStatusBarStyleArea(
            child: TimelineWidget(),
          );
        },
        tabBodyOverlayBuilder: (BuildContext context, int index) =>
            StatusListTapToLoadOverlayWidget(),
        tabBarViewContainerBuilder: null,
      ),
    );
  }

  Widget buildFilterActionButton(BuildContext context) {
    return FediIconInCircleBlurredButton(
      FediIcons.filter,
      onPressed: () {
        goToTimelinesHomeTabStoragePage(context);
      },
    );
  }

  Widget buildAddTimelineActionButton(BuildContext context) {
    return FediIconInCircleBlurredButton(
      FediIcons.plus,
      onPressed: () {
        goToCreateItemTimelinesHomeTabStoragePage(context);
      },
    );
  }

  Widget buildSearchActionButton(BuildContext context) =>
      FediTransparentIconTextButton(
        S.of(context).app_search_title,
        FediIcons.search,
        onPressed: () {
          goToSearchPage(context);
        },
        height: FediSizes.iconInCircleDefaultSize,
      );

  Widget _buildTabIndicatorWidget(
    BuildContext context,
    timelineTabBlocsList,
  ) {
    if (timelineTabBlocsList == null) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, right: FediSizes.bigPadding),
      child: TimelineTabListTextTabIndicatorItemWidget(),
    );
  }

  Widget _buildLoading(BuildContext context) {
    _logger.finest(() => "_buildLoading");
    return Container(
      width: double.infinity,
      color: IFediUiColorTheme.of(context).white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FediCircularProgressIndicator(),
          Text(S.of(context).app_timeline_loading,
            style: IFediUiTextTheme.of(context).bigShortBoldDarkGrey,
          )
        ],
      ),
    );
  }
}
