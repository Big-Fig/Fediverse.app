import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/refactored/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/refactored/app/timeline/timeline_widget.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_header_widget.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: buildTabBar(context, tabs, timelinesTabsBloc)),
          Expanded(child: buildBodyWidget(context)),
        ],
      ),
    );
  }

  Widget buildTabBar(BuildContext context, List<TimelineTab> tabs,
          ITimelineTabsBloc timelineTabsBloc) =>
      Row(
        children: [
          Flexible(
            child: TabBar(
              tabs: tabs.map((tab) {
                return buildTab(context, tab);
              }).toList(),
              onTap: (index) {
                timelineTabsBloc.selectTab(tabs[index]);
              },
            ),
          ),
          Row(
            children: appBarActionWidgets,
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
            child: TimelineWidget(
              key: PageStorageKey(tab.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
