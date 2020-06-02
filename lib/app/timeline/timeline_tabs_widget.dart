import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/timeline_post_status_header_widget.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_container_with_overlay_widget.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_unread_badge_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/ui/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

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

    return Builder(builder: (context) {
      return DefaultTabController(
        length: tabs.length,
        initialIndex: tabs.indexOf(timelinesTabsBloc.selectedTab),
        child: NestedScrollView(
          controller:
              IScrollControllerBloc.of(context, listen: false).scrollController,
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              buildSliverAppBar(context, tabs, timelinesTabsBloc),
            ];
          },
          body: buildBodyWidget(context),
        ),
      );
    });
  }

  SliverPersistentHeader buildSliverAppBar(BuildContext context,
      List<TimelineTab> tabs, ITimelineTabsBloc timelinesTabsBloc) {
    return SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: FediSliverAppBar(
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
//          collapsedAppBarBody: _buildCollapsedAppBarBody(context),
          collapsedAppBarBody: null,
          statusBarHeight: MediaQuery.of(context).padding.top,
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
                    .map((tab) =>
                        Provider<IPaginationListWithNewItemsBloc>.value(
                          value: timelineTabsBloc
                              .retrieveTimelineTabPaginationListBloc(tab),
                          child: PaginationListWithNewItemsUnreadBadgeWidget(
                            child: FediTextTab(
                              mapTabToTitle(context, tab),
                              index: tabs.indexOf(tab),
                              isTransparent: true,
                            ),
                          ),
                        ))
                    .toList(),
                ...appBarActionWidgets
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

  Widget buildBodyWidget(BuildContext context) {
    var timelineTabsBloc = ITimelineTabsBloc.of(context, listen: true);
    _logger.finest(() => "buildBodyWidget");
    var tabs = timelineTabsBloc.tabs;
    return Column(
      children: [
        Builder(
          builder: (context) {
            var scrollControllerBloc =
                IScrollControllerBloc.of(context, listen: false);
            var fediSliverAppBarBloc =
                IFediSliverAppBarBloc.of(context, listen: false);

            return StreamBuilder<bool>(
                stream: Rx.combineLatest2(
                    scrollControllerBloc.scrollDirectionStream,
                    fediSliverAppBarBloc.isAtLeastStartExpandStream,
                    (scrollDirection, isAtLeastStartExpand) =>
                        scrollDirection != ScrollDirection.reverse &&
                        isAtLeastStartExpand == false),
                builder: (context, snapshot) {
                  var show = snapshot.data;
                  if (show) {
                    return FediDarkStatusBarStyleArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        child: Container(
                          decoration: BoxDecoration(
                              color: FediColors.white,
                              boxShadow: [FediShadows.forTopBar]),
                          child: _buildCollapsedAppBarBody(context),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                });
          },
        ),
        Expanded(
          child: TabBarView(
              children: List<Widget>.generate(
            tabs.length,
            (int index) {
              var tab = tabs[index];

              return buildTabBody(context, tab, timelineTabsBloc);
            },
          )),
        ),
      ],
    );
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
            padding: const EdgeInsets.only(top: 24),
          ),
        ),
      ),
    );
  }
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
