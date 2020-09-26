import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_local_preferences_bloc.dart';
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
import 'package:fedi/app/timeline/tab/timeline_tab_text_tab_indicator_item_widget.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
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
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TimelinesHomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DisposableProvider<ITimelinesHomeTabStorageBloc>(
      create: (context) => TimelinesHomeTabStorageBloc(
        preferences: ITimelinesHomeTabStorageLocalPreferences.of(
          context,
          listen: false,
        ),
        authInstance:
            ICurrentAuthInstanceBloc.of(context, listen: false).currentInstance,
        preferencesService: ILocalPreferencesService.of(
          context,
          listen: false,
        ),
      ),
      child: Builder(
        builder: (context) {
          return DisposableProvider<ITimelineTabsListBloc>(
            create: (context) {
              var homeBloc = IHomeBloc.of(context, listen: false);

              var timelineTabsBloc =
                  TimelineTabsBloc.createFromContext(context);

              timelineTabsBloc.performAsyncInit().then((_) {
                var blocForUnreadBadge = timelineTabsBloc.tabBlocs.firstWhere(
                    (bloc) => bloc.timeline.type == TimelineType.home);

                timelineTabsBloc.addDisposable(
                  streamSubscription: blocForUnreadBadge
                      .paginationListWithNewItemsBloc
                      .unmergedNewItemsCountStream
                      .listen((unreadCount) {
                    homeBloc.updateTimelinesUnread(
                        unreadCount != null && unreadCount > 0);
                  }),
                );
              });

              return timelineTabsBloc;
            },
            child: Builder(
                builder: (context) => FediAsyncInitLoadingWidget(
                      asyncInitLoadingBloc: ITimelinesHomeTabStorageBloc.of(
                          context,
                          listen: false),
                      loadingFinishedBuilder: (context) =>
                          FediAsyncInitLoadingWidget(
                        asyncInitLoadingBloc:
                            ITimelineTabsListBloc.of(context, listen: false),
                        loadingFinishedBuilder: (BuildContext context) {
                          var timelineTabsListBloc =
                              ITimelineTabsListBloc.of(context, listen: false);

                          return StreamBuilder<List<ITimelineTabBloc>>(
                              stream: timelineTabsListBloc.tabBlocsStream,
                              initialData: timelineTabsListBloc.tabBlocs,
                              builder: (context, snapshot) {
                                var tabBlocs = snapshot.data;
                                return Provider<List<ITimelineTabBloc>>.value(
                                  value: tabBlocs,
                                  child: Builder(
                                    builder: (context) {
                                      return DisposableProxyProvider<
                                          List<ITimelineTabBloc>,
                                          ITimelinesHomeTabPageBodyBloc>(
                                        update: (context, value, previous) =>
                                            TimelinesHomeTabPageBodyBloc(
                                          timelineBlocs: value,
                                        ),
                                        child: TimelinesHomeTabPageBody(),
                                      );
                                    },
                                  ),
                                );
                              });
                        },
                      ),
                    )),
          );
        },
      ),
    );
  }
}

abstract class ITimelinesHomeTabPageBodyBloc extends Disposable {
  static ITimelinesHomeTabPageBodyBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelinesHomeTabPageBodyBloc>(context, listen: listen);

  List<ITimelineTabBloc> get timelineBlocs;
}

class TimelinesHomeTabPageBodyBloc extends DisposableOwner
    implements ITimelinesHomeTabPageBodyBloc {
  @override
  final List<ITimelineTabBloc> timelineBlocs;

  TimelinesHomeTabPageBodyBloc({@required this.timelineBlocs});
}

class TimelinesHomeTabPageBody extends StatefulWidget {
  TimelinesHomeTabPageBody({
    Key key,
  }) : super(key: key);

  @override
  _TimelinesHomeTabPageBodyState createState() =>
      _TimelinesHomeTabPageBodyState();
}

class _TimelinesHomeTabPageBodyState extends State<TimelinesHomeTabPageBody>
    with TickerProviderStateMixin {
  TabController tabController;

  VoidCallback listener;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var timelineTabBlocs =
        ITimelinesHomeTabPageBodyBloc.of(context, listen: false).timelineBlocs;
    tabController = TabController(
      vsync: this,
      length: timelineTabBlocs.length,
    );

    listener = () {
      var tabBloc = timelineTabBlocs[tabController.index];
      var notificationTabsBloc =
          ITimelineTabsListBloc.of(context, listen: false);
      var paginationListBloc = tabBloc.paginationListWithNewItemsBloc;
      if (paginationListBloc.unmergedNewItemsCount > 0) {
        paginationListBloc.mergeNewItems();
      }
      notificationTabsBloc.selectTab(tabBloc);
    };
    tabController.addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();

    tabController.removeListener(listener);
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBodyWidget(context),
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    var timelineTabsBloc = ITimelineTabsListBloc.of(context, listen: false);
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
                      buildFilterActionButton(context, timelineTabsBloc)
                    ],
                  ),
                ),
                FediBigVerticalSpacer(),
                Row(
                  children: [
                    Expanded(
                      child: _buildTabIndicatorWidget(context),
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
            (BuildContext context, int index, Widget child) {
          var tabBloc = timelineTabsBloc.tabBlocs[index];
          return Provider<ITimelineLocalPreferencesBloc>.value(
            value: tabBloc.timelineLocalPreferencesBloc,
            child: Provider<
                ICachedPaginationListWithNewItemsBloc<
                    CachedPaginationPage<IStatus>, IStatus>>.value(
              value: tabBloc.paginationListWithNewItemsBloc,
              child: CachedPaginationListWithNewItemsBlocProxyProvider<
                  CachedPaginationPage<IStatus>, IStatus>(child: child),
            ),
          );
        },
        tabBodyContentBuilder: (BuildContext context, int index) {
          var tabBloc = timelineTabsBloc.tabBlocs[index];

          return Provider<ITimelineLocalPreferencesBloc>.value(
            value: tabBloc.timelineLocalPreferencesBloc,
            child: FediDarkStatusBarStyleArea(
              child: TimelineWidget(),
            ),
          );
        },
        tabBodyOverlayBuilder: (BuildContext context, int index) =>
            StatusListTapToLoadOverlayWidget(),
        tabBarViewContainerBuilder: null,
      ),
    );
  }

  Widget buildFilterActionButton(
      BuildContext context, ITimelineTabsListBloc timelineTabsBloc) {
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
        "app.search.title".tr(),
        FediIcons.search,
        onPressed: () {
          goToSearchPage(context);
        },
        height: FediSizes.iconInCircleDefaultSize,
      );

  Widget _buildTabIndicatorWidget(BuildContext context) {
    var timelineTabBlocs =
        ITimelinesHomeTabPageBodyBloc.of(context, listen: false).timelineBlocs;
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, right: FediSizes.bigPadding),
      child: TimelineTabTextTabIndicatorItemWidget(
        tabController: tabController,
        timelineTabBlocs: timelineTabBlocs,
      ),
    );
  }
}
