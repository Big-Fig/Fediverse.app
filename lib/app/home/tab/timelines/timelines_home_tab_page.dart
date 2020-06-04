import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc.dart';
import 'package:fedi/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc_impl.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/app/timeline/timeline_tabs_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_tabs_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fedi/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_widget.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class TimelinesHomeTabPage extends StatelessWidget {
  const TimelinesHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      endDrawer: DisposableProvider<ITimelinesHomeTabPageDrawerBloc>(
        create: (BuildContext context) => TimelinesHomeTabPageDrawerBloc(
            localPreferencesBloc:
                ITimelineLocalPreferencesBloc.of(context, listen: false)),
        child: const TimelinesHomeTabPageDrawerWidget(),
      ),
      body: DisposableProvider<ITimelineTabsBloc>(
          create: (BuildContext context) {
            var homeBloc = IHomeBloc.of(context, listen: false);
            var timelineTabsBloc =
                TimelineTabsBloc.createFromContext(context, TimelineTab.home);

            timelineTabsBloc.addDisposable(
                streamSubscription: timelineTabsBloc.tabsMap[TimelineTab.home]
                    .paginationListWithNewItemsBloc.unmergedNewItemsCountStream
                    .listen((unreadCount) {
              homeBloc.updateTimelinesUnread(
                  unreadCount != null && unreadCount > 0);
            }));
            return timelineTabsBloc;
          },
          child: TimelineTabsWidget(
            key: key,
            appBarActionWidgets: <Widget>[
              buildSearchActionButton(context),
              SizedBox(
                width: 16.0,
              ),
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
