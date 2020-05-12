import 'package:fedi/refactored/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc.dart';
import 'package:fedi/refactored/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc_impl.dart';
import 'package:fedi/refactored/app/search/search_page.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/refactored/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/refactored/app/timeline/timeline_tabs_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/timeline_tabs_widget.dart';
import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/refactored/app/ui/fedi_icons.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer/timelines_home_tab_page_drawer_widget.dart';

class TimelinesHomeTabPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  TimelinesHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      endDrawer: DisposableProvider<ITimelinesHomeTabPageDrawerBloc>(
        create: (BuildContext context) => TimelinesHomeTabPageDrawerBloc(
            localPreferencesBloc:
                ITimelineLocalPreferencesBloc.of(context, listen: false)),
        child: TimelinesHomeTabPageDrawerWidget(),
      ),
      body: DisposableProvider<ITimelineTabsBloc>(
          create: (BuildContext context) =>
              TimelineTabsBloc.createFromContext(context, TimelineTab.home),
          child: TimelineTabsWidget(
            key: key,
            appBarActionWidgets: <Widget>[
              buildSearchActionButton(context),
              buildFilterActionButton()
            ],
          )),
    );
  }

  Widget buildFilterActionButton() => FediIconInCircleTransparentButton(
        FediIcons.filter,
        onPressed: () {
          _drawerKey.currentState.openEndDrawer();
        },
      );

  Widget buildSearchActionButton(BuildContext context) =>
      FediIconInCircleTransparentButton(
        FediIcons.search,
        onPressed: () {
          goToSearchPage(context);
        },
      );
}
