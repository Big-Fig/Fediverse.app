import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/chat/unread/chat_unread_badge_count_widget.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/app/home/home_timelines_unread_badge_widget.dart';
import 'package:fedi/app/notification/unread/notification_unread_exclude_types_badge_widget.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/icon/fedi_transparent_icon.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: tabsWithPlusButton.map((tab) {
        if (tab != null) {
          return buildTabNavBarItem(context, homeBloc, tab);
        } else {
          return buildNewMessageNavBarItem(context);
        }
      }).toList(),
    );
  }

  Widget buildNewMessageNavBarItem(BuildContext context) => InkWell(
      onTap: () {
        goToNewPostStatusPage(context);
      },
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: const FediTransparentIcon(FediIcons.plus),
      ));

  Widget buildTabNavBarItem(
          BuildContext context, IHomeBloc homeBloc, HomeTab tab) =>
      StreamBuilder<HomeTab>(
          stream: homeBloc.selectedTabStream,
          builder: (context, snapshot) {
            var selectedTab = snapshot.data;

            return InkWell(
                onTap: () {
                  IHomeBloc.of(context, listen: false).selectTab(tab);
                },
                child: mapTabToIcon(context, tab, selectedTab == tab));
          });

  Widget mapTabToIcon(BuildContext context, HomeTab tab, bool isSelected) {
    var color = isSelected ? IFediUiColorTheme.of(context).primary : IFediUiColorTheme.of(context).darkGrey;

    // todo: refactor UI
    const insets = FediPadding.allBigPadding;
    var additionalOffset = 2.0;
    var badgeOffset = additionalOffset + FediSizes.smallPadding;
    switch (tab) {
      case HomeTab.timelines:
        return HomeTimelinesUnreadBadgeWidget(
          offset: badgeOffset,
          child: Padding(
            padding: insets,
            child: FediTransparentIcon(
              FediIcons.home,
              color: color,
            ),
          ),
        );
        break;
      case HomeTab.notifications:
        return NotificationUnreadBadgeExcludeTypesWidget(
            excludeTypes: <PleromaNotificationType>[
              PleromaNotificationType.pleromaChatMention
            ],
            offset: badgeOffset,
            child: Padding(
              padding: insets,
              child: FediTransparentIcon(
                FediIcons.notification,
                color: color,
              ),
            ));
        break;
      case HomeTab.messages:
        var myAccountSettingsBloc =
            IMyAccountSettingsBloc.of(context, listen: false);
        return StreamBuilder<bool>(
            stream: myAccountSettingsBloc.isNewChatsEnabledFieldBloc.currentValueStream,
            builder: (context, snapshot) {
              var isNewChatsEnabled = snapshot.data;

              final iconData = FediIcons.chat;
              if (isNewChatsEnabled == true) {
                return ChatUnreadBadgeCountWidget(
                    offset: badgeOffset,
                    child: Padding(
                  padding: insets,
                  child: FediTransparentIcon(iconData, color: color),
                ));
              } else {
                return Padding(
                  padding: insets,
                  child: FediTransparentIcon(iconData, color: color),
                );
              }
            });
        break;
      case HomeTab.account:
        return GestureDetector(
          onLongPress: () {
            showMyAccountActionListBottomSheetDialog(context);
          },
          child: Padding(
            padding: insets,
            child: const MyAccountAvatarWidget(),
          ),
        );
        break;
    }

    throw "mapTabToIcon invalid tab=$tab";
  }
}
