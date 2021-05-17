
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/home/tab/timelines/storage/local_preferences/timelines_home_tab_storage_local_preference_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_page.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_overlay_on_long_scroll_widget.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_post_status_header_widget.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_tab_controller_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_tab_controller_bloc_impl.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_text_tab_indicator_item_widget.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/icon_text/with_border/fedi_transparent_icon_text_button_with_border.dart';
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
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';


final _logger = Logger("timelines_home_tab_page.dart");

class TimelinesHomeTabPage extends StatelessWidget {
  const TimelinesHomeTabPage();

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    var timelinesHomeTabStorageLocalPreferencesBloc =
        ITimelinesHomeTabStorageLocalPreferenceBloc.of(context);

    return StreamBuilder<TimelinesHomeTabStorage?>(
      stream: timelinesHomeTabStorageLocalPreferencesBloc.stream,
      builder: (context, snapshot) {
        var timelinesHomeTabStorage = snapshot.data;

        if (timelinesHomeTabStorage == null) {
          return const SizedBox.shrink();
        }

        return Provider<List<String>>.value(
          value: timelinesHomeTabStorage.timelineIds,
          child: DisposableProxyProvider<List<String>, ITimelineTabListBloc>(
            update: (
              BuildContext context,
              List<String> value,
              ITimelineTabListBloc? previous,
            ) {
              if (listEquals(value, previous?.timelineIds)) {
                return previous!;
              }

              var timelineTabListBloc = TimelineTabListBloc(
                timelineIds: value,
                oldSelectedTimelineId:
                    previous?.selectedTimelineTabBloc.timelineId,
                timelineTabBlocCreator: (
                  String timelineId,
                  WebSocketsListenType webSocketsListenType,
                ) =>
                    TimelineTabBloc.createFromContext(
                  context,
                  timelineId: timelineId,
                  webSocketsListenType: webSocketsListenType,
                ),
              );

              _logger.finest(() => "create timelineTabListBloc");

              timelineTabListBloc.performAsyncInit();

              return timelineTabListBloc;
            },
            child: const _TimelinesHomeTabPageBody(),
          ),
        );
      },
    );
  }
}

class _TimelinesHomeTabPageBody extends StatefulWidget {
  const _TimelinesHomeTabPageBody();

  @override
  _TimelinesHomeTabPageBodyState createState() =>
      _TimelinesHomeTabPageBodyState();
}

class _TimelinesHomeTabPageBodyState extends State<_TimelinesHomeTabPageBody>
    with TickerProviderStateMixin {
  void _subscribeForUnreadCountUpdates({
    required ITimelineTabListBloc timelineTabListBloc,
    required IHomeBloc homeBloc,
  }) {
    var mainTimelineTabBloc = timelineTabListBloc.homeTimelineTabBloc;

    timelineTabListBloc.addDisposable(
      streamSubscription: mainTimelineTabBloc
          .paginationListWithNewItemsBloc.unmergedNewItemsCountStream
          .listen(
        (unreadCount) {
          homeBloc.updateTimelinesUnread(unreadCount > 0);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var timelinesHomeTabBloc = ITimelinesHomeTabBloc.of(context);
    var timelineTabListBloc = ITimelineTabListBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: timelineTabListBloc,
      loadingFinishedBuilder: (context) =>
          ProxyProvider<ITimelineTabListBloc, ITimelineListTabControllerBloc>(
        update: (context, value, previous) {
          // ITimelineTabListBloc already initialized
          var homeBloc = IHomeBloc.of(context, listen: false);
          _subscribeForUnreadCountUpdates(
            timelineTabListBloc: timelineTabListBloc,
            homeBloc: homeBloc,
          );

          return TimelineListTabControllerBloc(
            timelineTabListBloc: value,
            vsync: this,
          );
        },
        child: Scaffold(
          backgroundColor: fediUiColorTheme.transparent,
          body: DisposableProxyProvider<ITimelineListTabControllerBloc,
              IFediNestedScrollViewWithNestedScrollableTabsBloc>(
            update: (context, ITimelineListTabControllerBloc value, previous) {
              _logger.finest(
                () =>
                    "IFediNestedScrollViewWithNestedScrollableTabsBloc update",
              );

              return FediNestedScrollViewWithNestedScrollableTabsBloc(
                nestedScrollControllerBloc:
                    timelinesHomeTabBloc.nestedScrollControllerBloc,
                tabController: value.tabController,
              );
            },
            child: FediNestedScrollViewWithNestedScrollableTabsWidget(
              tabsEmptyBuilder: (context) =>
                  const _TimelinesHomeTabPageTabLoadingWidget(),
              onLongScrollUpTopOverlayWidget:
                  const TimelinesHomeTabOverlayOnLongScrollWidget(),
              topSliverWidgets: [
                const _TimelinesHomeTabPageBodyHeaderFirstRowWidget(),
                const _TimelinesHomeTabPageBodyHeaderSecondRowWidget(),
              ],
              // white status bar over post status header
              // ignore: no-magic-number
              topSliverScrollOffsetToShowWhiteStatusBar: 100,
              tabKeyPrefix: "TimelineTab",
              tabBodyProviderBuilder:
                  (BuildContext context, int index, Widget child) =>
                      _provideTabBodyContext(context, index, child),
              tabBodyContentBuilder: (BuildContext context, int index) =>
                  buildTabBodyContent(),
              tabBodyOverlayBuilder: (BuildContext context, int index) =>
                  const StatusListTapToLoadOverlayWidget(),
              tabBarViewContainerBuilder: null,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTabBodyContent() {
    return FediDarkStatusBarStyleArea(
      child: const TimelineWidget(),
    );
  }

  Provider<ITimelineTabBloc> _provideTabBodyContext(
    BuildContext context,
    int index,
    Widget child,
  ) {
    var timelineTabListBloc = ITimelineTabListBloc.of(context, listen: false);
    var tabBloc = timelineTabListBloc.timelineTabBlocs[index];

    _logger.finest(() => "tabBodyProviderBuilder index $index "
        "tabBloc ${tabBloc.timelineId}");

    return Provider<ITimelineTabBloc>.value(
      value: tabBloc,
      child: ProxyProvider<ITimelineTabBloc, ITimelineLocalPreferenceBloc>(
        update: (context, value, previous) =>
            value.timelineLocalPreferencesBloc,
        // value: tabBloc.timelineLocalPreferencesBloc,
        child: ProxyProvider<
            ITimelineTabBloc,
            ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>,
                IStatus>>(
          // value: tabBloc.paginationListWithNewItemsBloc,
          update: (context, value, previous) =>
              value.paginationListWithNewItemsBloc,
          child: CachedPaginationListWithNewItemsBlocProxyProvider<
              CachedPaginationPage<IStatus>, IStatus>(
            child: ProxyProvider<ITimelineTabBloc, IStatusCachedListBloc>(
              // value: tabBloc.paginationListWithNewItemsBloc,
              update: (context, value, previous) => value.statusCachedListBloc,
              child: StatusCachedListBlocProxyProvider(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TimelinesHomeTabPageBodyHeaderSecondRowWidget extends StatelessWidget {
  const _TimelinesHomeTabPageBodyHeaderSecondRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediDarkStatusBarStyleArea(
        child: ClipRRect(
          borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
          child: Container(
            color: IFediUiColorTheme.of(context).offWhite,
            child: const FediListTile(
              isFirstInList: true,
              // special hack to avoid 1px horizontal line on some devices
              oneSidePadding: FediSizes.smallPadding - 1,
              child: TimelinesHomeTabPostStatusHeaderWidget(),
            ),
          ),
        ),
      );
}

class _TimelinesHomeTabPageBodyHeaderFirstRowWidget extends StatelessWidget {
  const _TimelinesHomeTabPageBodyHeaderFirstRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediTabMainHeaderBarWidget(
      leadingWidgets: null,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: FediPadding.horizontalSmallPadding,
            child: Row(
              children: [
                Expanded(
                  child: FediTransparentIconTextButtonWithBorder(
                    S.of(context).app_search_title,
                    FediIcons.search,
                    onPressed: () {
                      goToSearchPage(context);
                    },
                    height: FediSizes.iconInCircleDefaultSize,
                  ),
                ),
                const FediBigHorizontalSpacer(),
                FediIconInCircleBlurredButton(
                  FediIcons.filter,
                  onPressed: () {
                    goToTimelinesHomeTabStoragePage(context);
                  },
                ),
              ],
            ),
          ),
          const FediBigVerticalSpacer(),
          _TimelinesHomeTabIndicatorWidget(),
        ],
      ),
      endingWidgets: null,
    );
  }
}

class _TimelinesHomeTabIndicatorWidget extends StatelessWidget {
  const _TimelinesHomeTabIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ignore: no-magic-number
      padding: EdgeInsets.only(
        // ignore: no-magic-number
        top: 3.0,
        right: FediSizes.bigPadding,
      ),
      child: TimelineTabListTextTabIndicatorItemWidget(),
    );
  }
}

class _TimelinesHomeTabPageTabLoadingWidget extends StatelessWidget {
  const _TimelinesHomeTabPageTabLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: IFediUiColorTheme.of(context).white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FediCircularProgressIndicator(),
          const FediSmallVerticalSpacer(),
          Text(
            S.of(context).app_timeline_loading,
            style: IFediUiTextTheme.of(context).bigShortBoldDarkGrey,
          ),
        ],
      ),
    );
  }
}
