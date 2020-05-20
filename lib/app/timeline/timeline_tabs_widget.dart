import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:fedi/app/ui/home/fedi_home_tab_container_widget.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_header_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
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
        child: FediHomeTabContainer(
          topHeaderHeightInSafeArea: 164.0,
          topBar: buildTabBar(context, tabs, timelinesTabsBloc),
          body: buildBodyWidget(context),
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
              children: appBarActionWidgets,
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tabs
                  .map((tab) => FediTextTab(mapTabToTitle(context, tab),
                      index: tabs.indexOf(tab)))
                  .toList()),
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
          child: const PaginationListWithNewItemsHeaderWidget(
            child: TimelineWidget(),
          ),
        ),
      ),
    );
  }
}
