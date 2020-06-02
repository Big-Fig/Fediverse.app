import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/app/home/home_page_bottom_navigation_bar_widget.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_page'
    '.dart';
import 'package:fedi/app/home/tab/conversations/chats_home_tab_page.dart';
import 'package:fedi/app/home/tab/conversations/conversations_home_tab_page.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_page.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_page.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("home_page.dart");

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    var homeBloc = IHomeBloc.of(context, listen: false);

    return StreamBuilder<HomeTab>(stream: homeBloc.selectedTabStream,
        initialData: homeBloc.selectedTab,
        builder: (context, snapshot) {
          var selectedTab = snapshot.data;

          _logger.finest(() => "selectedTab $selectedTab");

          if (selectedTab == null) {
            return SizedBox.shrink();
          }
          return Scaffold(
            body: buildBody(context, selectedTab),
            bottomNavigationBar: Container(
              height: 58,
              child: Column(children: [
                const FediUltraLightGreyDivider(),
                const HomePageBottomNavigationBarWidget(),
              ],),),);
        });
  }

  Widget buildBody(BuildContext context, HomeTab selectedTab) {
    switch (selectedTab) {
      case HomeTab.timelines:
        return DisposableProvider<ITimelinesHomeTabBloc>(create: (context) {
          var homeBloc = IHomeBloc.of(context, listen: false);
          var timelinesHomeTabBloc = TimelinesHomeTabBloc();

          timelinesHomeTabBloc.addDisposable(
              streamSubscription: homeBloc.reselectedTabStream.listen((
                  reselectedTab) {
                if (reselectedTab == HomeTab.timelines) {
                  timelinesHomeTabBloc.scrollToTop();
                }
              }));
          return timelinesHomeTabBloc;
        },
          child: ProxyProvider<ITimelinesHomeTabBloc, IScrollDirectionDetector>(
            update: (context, value, previous) => value.scrollDirectionDetector,
            child: const TimelinesHomeTabPage(
              key: PageStorageKey<String>("TimelinesHomeTabPage"),),
          ),);
        break;
      case HomeTab.notifications:
        return Semantics(container: true,
            child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: const NotificationsHomeTabPage(
                    key: PageStorageKey<String>("NotificationsHomeTabPage"))));
        break;
      case HomeTab.conversations:
        var myAccountSettingsBloc = IMyAccountSettingsBloc.of(
            context, listen: false);

        return StreamBuilder<bool>(
            stream: myAccountSettingsBloc.isNewChatsEnabledStream,
            initialData: myAccountSettingsBloc.isNewChatsEnabled,
            builder: (context, snapshot) {
              var isNewChatsEnabled = snapshot.data;

              if (isNewChatsEnabled == true) {
                return Semantics(container: true,
                    child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: SystemUiOverlayStyle.light,
                        child: const ChatsHomeTabPage(
                            key: PageStorageKey<String>("ChatsHomeTabPage"))));
              } else {
                return Semantics(container: true,
                    child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value: SystemUiOverlayStyle.light,
                        child: const ConversationsHomeTabPage(
                            key: PageStorageKey<String>(
                                "ConversationsHomeTabPage"))));
              }
            });

        break;
      case HomeTab.account:
        return Semantics(container: true,
            child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: const AccountHomeTabPage()));
        break;
    }

    throw "buildBody invalid selectedTab = $selectedTab";
  }

  const HomePage();
}
