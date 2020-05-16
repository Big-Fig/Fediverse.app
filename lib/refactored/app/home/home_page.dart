import 'package:fedi/refactored/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/refactored/app/home/home_bloc.dart';
import 'package:fedi/refactored/app/home/home_model.dart';
import 'package:fedi/refactored/app/home/home_page_bottom_navigation_bar_widget.dart';
import 'package:fedi/refactored/app/home/tab/account/account_home_tab_page'
    '.dart';
import 'package:fedi/refactored/app/home/tab/conversations/chats_home_tab_page.dart';
import 'package:fedi/refactored/app/home/tab/conversations/conversations_home_tab_page.dart';
import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_page.dart';
import 'package:fedi/refactored/app/home/tab/timelines/timelines_home_tab_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("home_page.dart");

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    var homeBloc = IHomeBloc.of(context, listen: false);

    return StreamBuilder<HomeTab>(
        stream: homeBloc.selectedTabStream,
        initialData: homeBloc.selectedTab,
        builder: (context, snapshot) {
          var selectedTab = snapshot.data;

          _logger.finest(() => "selectedTab $selectedTab");

          if (selectedTab == null) {
            return SizedBox.shrink();
          }
          return Scaffold(
            body: buildBody(context, selectedTab),
            bottomNavigationBar: const HomePageBottomNavigationBarWidget(),
          );
        });
  }

  Widget buildBody(BuildContext context, HomeTab selectedTab) {
    switch (selectedTab) {
      case HomeTab.timelines:
        return const TimelinesHomeTabPage(
          key: PageStorageKey<String>("TimelinesHomeTabPage"),
        );
        break;
      case HomeTab.notifications:
        return const NotificationsHomeTabPage(
            key: PageStorageKey<String>("NotificationsHomeTabPage"));
        break;
      case HomeTab.conversations:
        var myAccountSettingsBloc =
            IMyAccountSettingsBloc.of(context, listen: false);

        return StreamBuilder<bool>(
            stream: myAccountSettingsBloc.isNewChatsEnabledStream,
            initialData: myAccountSettingsBloc.isNewChatsEnabled,
            builder: (context, snapshot) {
              var isNewChatsEnabled = snapshot.data;

              if (isNewChatsEnabled == true) {
                return const ChatsHomeTabPage(
                    key: PageStorageKey<String>("ChatsHomeTabPage"));
              } else {
                return const ConversationsHomeTabPage(
                    key: PageStorageKey<String>("ConversationsHomeTabPage"));
              }
            });

        break;
      case HomeTab.account:
        return const AccountHomeTabPage();
        break;
    }

    throw "buildBody invalid selectedTab = $selectedTab";
  }

  const HomePage();
}
