import 'package:fedi/refactored/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/refactored/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/refactored/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/refactored/app/chat/unread/chat_unread_badge_count_widget.dart';
import 'package:fedi/refactored/app/home/home_model.dart';
import 'package:fedi/refactored/app/home/tab/account/account_home_tab_page'
    '.dart';
import 'package:fedi/refactored/app/home/tab/conversations/chats_home_tab_page.dart';
import 'package:fedi/refactored/app/home/tab/conversations/conversations_home_tab_page.dart';
import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_page.dart';
import 'package:fedi/refactored/app/home/tab/timelines/timelines_home_tab_page.dart';
import 'package:fedi/refactored/app/notification/unread/notification_unread_exclude_types_badge_count_widget.dart';
import 'package:fedi/refactored/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/refactored/app/ui/fedi_icons.dart';
import 'package:fedi/refactored/app/ui/icon/fedi_transparent_circle_icon.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("home_page.dart");

const List<AppHomeTab> tabs = [
  AppHomeTab.timelines,
  AppHomeTab.notifications,
  null, // new status button
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
              return buildNewMessageNavBarItem();
            }
          }).toList()),
    );
  }

  BottomNavigationBarItem buildNewMessageNavBarItem() => BottomNavigationBarItem(
      icon: GestureDetector(
          onTap: () {
            goToNewPostStatusPage(context);

          },
          child: FediTransparentIcon(FediIcons.plus)), title: Text(''));

  BottomNavigationBarItem buildTabNavBarItem(
          BuildContext context, AppHomeTab tab) =>
      BottomNavigationBarItem(
        icon: mapTabToIcon(context, tab),
        title: Text(''),
      );

  Widget mapTabToIcon(BuildContext context, AppHomeTab tab) {
    switch (tab) {
      case AppHomeTab.timelines:
        return FediTransparentIcon(FediIcons.home);
        break;
      case AppHomeTab.notifications:
        return NotificationUnreadBadgeExcludeTypesCountWidget(
            excludeTypes: <PleromaNotificationType>[
              PleromaNotificationType.chatMention
            ],
            child: FediTransparentIcon(FediIcons.notification));
        break;
      case AppHomeTab.conversations:
        var myAccountSettingsBloc =
            IMyAccountSettingsBloc.of(context, listen: false);
        return StreamBuilder<bool>(
            stream: myAccountSettingsBloc.isNewChatsEnabledStream,
            builder: (context, snapshot) {
              var isNewChatsEnabled = snapshot.data;

              var icon = FediTransparentIcon(FediIcons.envelope);
              if (isNewChatsEnabled == true) {
                return ChatUnreadBadgeCountWidget(child: icon);
              } else {
                return icon;
              }
            });
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
        var myAccountSettingsBloc =
            IMyAccountSettingsBloc.of(context, listen: false);

        return StreamBuilder<bool>(
            stream: myAccountSettingsBloc.isNewChatsEnabledStream,
            initialData: myAccountSettingsBloc.isNewChatsEnabled,
            builder: (context, snapshot) {
              var isNewChatsEnabled = snapshot.data;

              if (isNewChatsEnabled == true) {
                return ChatsHomeTabPage(
                    key: PageStorageKey<String>("ChatsHomeTabPage"));
              } else {
                return ConversationsHomeTabPage(
                    key: PageStorageKey<String>("ConversationsHomeTabPage"));
              }
            });

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
