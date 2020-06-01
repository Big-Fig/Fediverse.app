import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/timeline_post_status_header_widget.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/page/my_sliver_app_bar.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_container_with_overlay_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("timeline_tabs_widget.dart");

class MySliverAppBarNew extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var scrollDirectionDetector =
        IScrollDirectionDetector.of(context, listen: false);
    return StreamBuilder<ScrollDirection>(
        stream: scrollDirectionDetector.scrollDirectionStream,
        initialData: scrollDirectionDetector.scrollDirection,
        builder: (context, snapshot) {
          var scrollDirection = snapshot.data;

          if (scrollDirection == ScrollDirection.forward &&
              shrinkOffset == maxExtent) {
            return Container(
                color: Colors.white, child: _buildCollapsedAppBarBody(context));
          } else {
            return SizedBox.shrink();
          }
        });
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

//  double get minExtent => statusBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class TimelineTabsWidget extends StatelessWidget {
  final List<Widget> appBarActionWidgets;

  TimelineTabsWidget({@required Key key, @required this.appBarActionWidgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesTabsBloc = ITimelineTabsBloc.of(context, listen: true);

    _logger.finest(() => "build");

    var tabs = timelinesTabsBloc.tabs;

    return DisposableProvider<IScrollDirectionDetector>(
      create: (context) {
        var scrollController = ScrollController();
        var scrollDirectionDetector =
            ScrollDirectionDetector(scrollController: scrollController);
        scrollDirectionDetector.addDisposable(
            scrollController: scrollController);
        return scrollDirectionDetector;
      },
      child: Builder(builder: (context) {

        return DefaultTabController(
            length: tabs.length,
            initialIndex: tabs.indexOf(timelinesTabsBloc.selectedTab),
            child: NestedScrollView(
              controller: IScrollDirectionDetector.of(context, listen: false)
                  .scrollController,
              headerSliverBuilder: (context, _) {
                return [
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: MySliverAppBar(
                        expandedHeight: 255 + 32.0 + 2.0,
                        topBar: buildTabBar(context, tabs, timelinesTabsBloc),
                        expandedAppBarBody: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                          child: FediListTile(
                            isFirstInList: true,
                            child: TimelinePostStatusHeaderWidget(),
                          ),
                        ),
                        collapsedAppBarBody: _buildCollapsedAppBarBody(context),
                        statusBarHeight: MediaQuery.of(context).padding.top,
                      )),
//                    SliverPersistentHeader(
//                      pinned: true,
//                      delegate: MySliverAppBarNew(),
//                    ),

//                    SliverPersistentHeader(
//                        pinned: true,
//                        delegate: MySliverAppBarSmall(
//                          expandedHeight: 255,
//                          topBar: buildTabBar(context, tabs, timelinesTabsBloc),
//                          expandedAppBarBody: FediListTile(
//                            isFirstInList: true,
//                            child: TimelinePostStatusHeaderWidget(),
//                          ),
//                          collapsedAppBarBody:
//                          _buildCollapsedAppBarBody(context),
//                          statusBarHeight: MediaQuery.of(context).padding.top,
//                        )),
                ];
              },
              body: buildBodyWidget(context),
            )
//        FediHomeSliverPage(
//          body: FediDarkStatusBarStyleArea(child: buildBodyWidget(context)),
//          appBar: FediHomeSliverPageExpandableSliverAppBar(
//            expandedAppBarBodyHeight: 96,
//            expandedAppBarTopBar: buildTabBar(context, tabs, timelinesTabsBloc),
//            expandedAppBarBody: FediListTile(
//              isFirstInList: true,
//              child: TimelinePostStatusHeaderWidget(),
//            ),
//            collapsedAppBarBody: StreamBuilder<ScrollDirection>(
//              stream: scrollDirectionDetector.scrollDirectionStream,
//              initialData: scrollDirectionDetector.scrollDirection,
//              builder: (context, snapshot) {
//                var scrollDirection = snapshot.data;
//
//                if(scrollDirection == ScrollDirection.forward) {
//                  return _buildCollapsedAppBarBody(context);
//                } else {
//
//                  return SizedBox.shrink();
//                }
//              }
//            ),
//          ),
//        ),
            );
      }),
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
          child: PaginationListWithNewItemsContainerWithOverlayWidget(
            textBuilder: (context, updateItemsCount) => plural(
                "app.status.list.new_items.action.tap_to_load_new",
                updateItemsCount),
            child: TimelineWidget(),
            padding: const EdgeInsets.only(top: 100),
          ),
        ),
      ),
    );
  }
}

GestureDetector _buildCollapsedAppBarBody(BuildContext context) {
  return GestureDetector(
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
