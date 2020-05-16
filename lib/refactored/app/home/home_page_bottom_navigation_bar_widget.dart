import 'package:fedi/refactored/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/refactored/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/refactored/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/refactored/app/chat/unread/chat_unread_badge_count_widget.dart';
import 'package:fedi/refactored/app/home/home_bloc.dart';
import 'package:fedi/refactored/app/home/home_model.dart';
import 'package:fedi/refactored/app/notification/unread/notification_unread_exclude_types_badge_count_widget.dart';
import 'package:fedi/refactored/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/refactored/app/ui/fedi_icons.dart';
import 'package:fedi/refactored/app/ui/icon/fedi_transparent_icon.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const text = Text('');

class HomePageBottomNavigationBarWidget extends StatelessWidget {
  const HomePageBottomNavigationBarWidget();

  @override
  Widget build(BuildContext context) {
    var homeBloc = IHomeBloc.of(context, listen: false);
    var tabs = homeBloc.tabs;

    var middleIndex = tabs.length ~/ 2;

    var tabsWithPlusButton = [
      ...tabs.sublist(0, middleIndex),
      null,
      ...tabs.sublist(middleIndex),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabsWithPlusButton.map((tab) {
          if (tab != null) {
            return buildTabNavBarItem(context, tab);
          } else {
            return buildNewMessageNavBarItem(context);
          }
        }).toList(),
      ),
    );
  }

  Widget buildNewMessageNavBarItem(BuildContext context) => GestureDetector(
      onTap: () {
        goToNewPostStatusPage(context);
      },
      child: const FediTransparentIcon(FediIcons.plus));

  Widget buildTabNavBarItem(BuildContext context, HomeTab tab) =>
      GestureDetector(
          onTap: () {
            IHomeBloc.of(context, listen: false).selectTab(tab);
          },
          child: mapTabToIcon(context, tab));

  Widget mapTabToIcon(BuildContext context, HomeTab tab) {
    switch (tab) {
      case HomeTab.timelines:
        return const FediTransparentIcon(FediIcons.home);
        break;
      case HomeTab.notifications:
        return NotificationUnreadBadgeExcludeTypesCountWidget(
            excludeTypes: <PleromaNotificationType>[
              PleromaNotificationType.pleromaChatMention
            ],
            child: const FediTransparentIcon(FediIcons.notification));
        break;
      case HomeTab.conversations:
        var myAccountSettingsBloc =
            IMyAccountSettingsBloc.of(context, listen: false);
        return StreamBuilder<bool>(
            stream: myAccountSettingsBloc.isNewChatsEnabledStream,
            builder: (context, snapshot) {
              var isNewChatsEnabled = snapshot.data;

              if (isNewChatsEnabled == true) {
                return const ChatUnreadBadgeCountWidget(
                    child: FediTransparentIcon(FediIcons.envelope));
              } else {
                return const FediTransparentIcon(FediIcons.envelope);
              }
            });
        break;
      case HomeTab.account:
        return GestureDetector(
          onLongPress: () {
            showMyAccountActionListBottomSheetDialog(context);
          },
          child: const MyAccountAvatarWidget(),
        );
        break;
    }

    throw "mapTabToIcon invalid tab=$tab";
  }
}
