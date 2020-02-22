import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Search/SearchPage.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/home/page/timelines/drawer/timelines_home_page_drawer_bloc.dart';
import 'package:fedi/app/home/page/timelines/drawer/timelines_home_page_drawer_bloc_impl.dart';
import 'package:fedi/app/home/page/timelines/drawer/timelines_home_page_drawer_widget.dart';
import 'package:fedi/app/home/page/timelines/timelines_home_page_bloc.dart';
import 'package:fedi/app/home/page/timelines/timelines_home_page_model.dart';
import 'package:fedi/app/timeline/home/home_timeline_widget.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/public/public_timeline_widget.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelinesHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var timelinesHomePageBloc =
        ITimelinesHomePageBloc.of(context, listen: true);
    List<TimelinesHomePageTab> tabs = timelinesHomePageBloc.tabs;

    return Provider<ITimelineLocalPreferencesBloc>(
      create: (BuildContext context) {
        var timelineLocalPreferencesBloc = TimelineLocalPreferencesBloc(
          ILocalPreferencesService.of(context, listen: false));
        timelineLocalPreferencesBloc.performAsyncInit();
        return timelineLocalPreferencesBloc;
      },
      child: Scaffold(
        key: _drawerKey,
        endDrawer: Provider<ITimelinesHomePageDrawerBloc>(
          create: (BuildContext context) => TimelinesHomePageDrawerBloc(
                localPreferencesBloc:
                    ITimelineLocalPreferencesBloc.of(context, listen: false)),
          child: TimelinesHomePageDrawerWidget(),
        ),
        appBar: AppBar(
          title: TabBar(
            controller: timelinesHomePageBloc.tabsController,
            tabs: tabs.map((tab) {
              return Tab(text: mapTabToTitle(context, tab));
            }).toList(),
            onTap: (index) {
              timelinesHomePageBloc.selectTab(index);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // push search view
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SerachPage(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                _drawerKey.currentState.openEndDrawer();
              },
            ),
          ],
        ),
        body: buildBodyWidget(context),
      ),
    );
  }

  String mapTabToTitle(BuildContext context, TimelinesHomePageTab tab) {
    var appLocalizations = AppLocalizations.of(context);

    switch (tab) {
      case TimelinesHomePageTab.all:
        return appLocalizations.tr("home.timeline.tabs.all");
        break;
      case TimelinesHomePageTab.home:
        return appLocalizations.tr("home.timeline.tabs.home");

        break;
      case TimelinesHomePageTab.local:
        return appLocalizations.tr("home.timeline.tabs.local");
        break;
    }

    throw "Invalid tab $tab";
  }

  Widget buildBodyWidget(BuildContext context) {
    var timelinesHomePageBloc =
        ITimelinesHomePageBloc.of(context, listen: false);

    return StreamBuilder<TimelinesHomePageTab>(
        stream: timelinesHomePageBloc.selectedTabStream,
        initialData: timelinesHomePageBloc.selectedTab,
        builder: (context, snapshot) {
          var tab = snapshot.data;

          switch (tab) {
            case TimelinesHomePageTab.all:
              return PublicTimelineWidget(onlyLocal: false, localUrlHost: null);
              break;
            case TimelinesHomePageTab.home:
              return HomeTimelineWidget(
                onlyLocal: false,
                localUrlHost: null,
                // todo: rework
                homeAccount: DbAccountWrapper(mapRemoteAccountToDbAccount(
                    CurrentInstance.instance.currentAccount)),
              );
              break;
            case TimelinesHomePageTab.local:
              var baseURL = CurrentInstance.instance.currentClient.baseURL;
              var localUrlHost = Uri.parse(baseURL).host;
              return PublicTimelineWidget(
                  onlyLocal: true, localUrlHost: localUrlHost);
              break;
          }

          throw "Invalid tab $tab";
        });
  }
}
