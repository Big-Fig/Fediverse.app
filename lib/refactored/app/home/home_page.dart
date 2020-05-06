import 'package:fedi/refactored/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/refactored/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/refactored/app/home/home_model.dart';
import 'package:fedi/refactored/app/home/tab/account/account_home_tab_page'
    '.dart';
import 'package:fedi/refactored/app/home/tab/conversations/conversations_home_tab_page.dart';
import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_page.dart';
import 'package:fedi/refactored/app/home/tab/timelines/timelines_home_tab_page.dart';
import 'package:fedi/refactored/app/notification/unread/notification_unread_all_badge_count_widget.dart';
import 'package:fedi/refactored/app/status/post/new/new_post_status_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("home_page.dart");

const List<AppHomeTab> tabs = [
  AppHomeTab.timelines,
  AppHomeTab.notifications,
  null,
  // spacer
  AppHomeTab.conversations,
  AppHomeTab.account,
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  const HomePage();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  AppHomeTab selectedTab = AppHomeTab.timelines;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    _logger.finest(() => "build");
    _logger.finest(() => "selectedTab $selectedTab");
    if (selectedTab == null) {
      return SizedBox.shrink();
    }
    return Scaffold(
      body: buildBody(context, selectedTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildNewPostFloatingActionButton(context),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: tabs.indexOf(selectedTab),
          onTap: (index) {
            var tab = tabs[index];

            if (tab != null) {
              setState(() {
                selectedTab = tab;
              });
            }
          },
          items: tabs.map((tab) {
            if (tab != null) {
              return buildTabNavBarItem(context, tab);
            } else {
              return buildSpacerNavBarItem();
            }
          }).toList()),
    );
  }

  BottomNavigationBarItem buildSpacerNavBarItem() => BottomNavigationBarItem(
      backgroundColor: Colors.blue, icon: Icon(null), title: Text(''));

  BottomNavigationBarItem buildTabNavBarItem(
          BuildContext context, AppHomeTab tab) =>
      BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        icon: mapTabToIcon(context, tab),
        title: Text(''),
      );

  Widget mapTabToIcon(BuildContext context, AppHomeTab tab) {
    switch (tab) {
      case AppHomeTab.timelines:
        return Icon(Icons.home);
        break;
      case AppHomeTab.notifications:
        return NotificationUnreadAllBadgeCountWidget(
            child: Icon(Icons.notifications));
        break;
      case AppHomeTab.conversations:
        return Icon(Icons.mail);
        break;
      case AppHomeTab.account:
        return GestureDetector(
          onLongPress: () {
            showMyAccountActionListBottomSheetDialog(context);
          },
          child: MyAccountAvatarWidget(),
        );
        break;
    }

    throw "mapTabToIcon invalid tab=$tab";
  }

  FloatingActionButton buildNewPostFloatingActionButton(BuildContext context) =>
      FloatingActionButton(
        onPressed: () {
          goToNewPostStatusPage(context);
        },
        child: Icon(Icons.add),
        elevation: 2.0,
      );

  Widget buildBody(BuildContext context, AppHomeTab selectedTab) {
    switch (selectedTab) {
      case AppHomeTab.timelines:
        return TimelinesHomeTabPage(
          key: PageStorageKey<String>("TimelinesHomeTabPage"),
        );
        break;
      case AppHomeTab.notifications:
        return NotificationsHomeTabPage(
            key: PageStorageKey<String>("NotificationsHomeTabPage"));
        break;
      case AppHomeTab.conversations:
        return ConversationsHomeTabPage(
            key: PageStorageKey<String>("ConversationsHomeTabPage")
        );
        break;
      case AppHomeTab.account:
        return AccountHomeTabPage();
        break;
    }

    throw "buildBody invalid selectedTab = $selectedTab";
  }

  @override
  bool get wantKeepAlive => true;
}
