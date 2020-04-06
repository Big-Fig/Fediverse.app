import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc.dart';
import 'package:fedi/refactored/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc_impl.dart';
import 'package:fedi/refactored/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_widget.dart';
import 'package:fedi/refactored/app/home/tab/timelines/timelines_home_tab_model.dart';
import 'package:fedi/refactored/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/refactored/app/search/search_page.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/timeline_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("timelines_home_tab_page.dart");

List<TimelineTab> tabs = [
  TimelineTab.home,
  TimelineTab.public,
  TimelineTab.local,
];

class TimelinesHomeTabPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  TimelinesHomeTabPage({@required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomePageBloc = ITimelinesHomeTabBloc.of(context, listen: true);

    _logger.finest(() => "build");

    return Scaffold(
      key: _drawerKey,
      endDrawer: DisposableProvider<ITimelinesHomeTabPageDrawerBloc>(
        create: (BuildContext context) => TimelinesHomeTabPageDrawerBloc(
            localPreferencesBloc:
                ITimelineLocalPreferencesBloc.of(context, listen: false)),
        child: TimelinesHomeTabPageDrawerWidget(),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: tabs.length,
          initialIndex: tabs.indexOf(timelinesHomePageBloc.selectedTab),
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: buildTabBar(context, tabs, timelinesHomePageBloc)),
              Expanded(child: buildBodyWidget(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabBar(BuildContext context, List<TimelineTab> tabs,
          ITimelinesHomeTabBloc timelinesHomePageBloc) =>
      Row(
        children: [
          Flexible(
            child: TabBar(
              tabs: tabs.map((tab) {
                return buildTab(context, tab);
              }).toList(),
              onTap: (index) {
                timelinesHomePageBloc.selectTab(tabs[index]);
              },
            ),
          ),
          Row(
            children: <Widget>[
              buildSearchActionButton(context),
              buildSettingsActionButton(),
            ],
          )
        ],
      );

  Tab buildTab(BuildContext context, TimelineTab tab) =>
      Tab(text: mapTabToTitle(context, tab));

  IconButton buildSettingsActionButton() => IconButton(
        icon: Icon(Icons.settings),
        color: Colors.white,
        onPressed: () {
          _drawerKey.currentState.openEndDrawer();
        },
      );

  IconButton buildSearchActionButton(BuildContext context) => IconButton(
        icon: Icon(Icons.search),
        color: Colors.white,
        onPressed: () {
          goToSearchPage(context);
        },
      );

  String mapTabToTitle(BuildContext context, TimelineTab tab) {
    var appLocalizations = AppLocalizations.of(context);

    switch (tab) {
      case TimelineTab.public:
        return appLocalizations.tr("app.home.timelines.tab.public");
        break;
      case TimelineTab.home:
        return appLocalizations.tr("app.home.timelines.tab.home");

        break;
      case TimelineTab.local:
        return appLocalizations.tr("app.home.timelines.tab.local");
        break;
    }

    throw "Invalid tab $tab";
  }

  Widget buildBodyWidget(BuildContext context) {
    var timelinesHomePageBloc = ITimelinesHomeTabBloc.of(context, listen: true);
    _logger.finest(() => "buildBodyWidget");


    return TabBarView(
        children: List<Widget>.generate(
      tabs.length,
      (int index) {
        var tab = tabs[index];

        return buildTabBody(context, tab, timelinesHomePageBloc);
      },
    ));
  }

  Widget buildTabBody(BuildContext context, TimelineTab tab,
      ITimelinesHomeTabBloc timelinesHomePageBloc) {
    _logger.finest(() => "new tab $tab");

    return Provider(
      create: (_) =>
          timelinesHomePageBloc.retrieveTimelineTabPaginationListBloc(tab),
      child: TimelineWidget(
        key: PageStorageKey(tab.toString()),
      ),
    );
  }
}
