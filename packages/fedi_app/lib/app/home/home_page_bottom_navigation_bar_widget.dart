import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi_app/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi_app/app/chat/unread/chat_unread_badge_bloc_impl.dart';
import 'package:fedi_app/app/filter/repository/filter_repository.dart';
import 'package:fedi_app/app/home/home_bloc.dart';
import 'package:fedi_app/app/home/home_model.dart';
import 'package:fedi_app/app/home/home_page_bottom_navigation_bar_widget_keys.dart';
import 'package:fedi_app/app/home/home_timelines_unread_badge_bloc_impl.dart';
import 'package:fedi_app/app/home/tab/account/badge/account_home_tab_int_badge_bloc_impl.dart';
import 'package:fedi_app/app/notification/repository/notification_repository.dart';
import 'package:fedi_app/app/notification/unread/notification_unread_exclude_types_bool_badge_bloc_impl.dart';
import 'package:fedi_app/app/status/post/new/new_post_status_page.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_widget.dart';
import 'package:fedi_app/app/ui/badge/int/fedi_int_badge_bloc_bool_adapter_proxy_provider.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/icon/fedi_transparent_icon.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class HomePageBottomNavigationBarWidget extends StatelessWidget {
  const HomePageBottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeBloc = IHomeBloc.of(context);
    var tabs = homeBloc.tabs;

    // ignore: no-magic-number
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
          return Provider.value(
            value: tab,
            child: const _HomePageBottomNavigationBarIconItemWidget(),
          );
        } else {
          return const _HomePageBottomNavigationBarNewMessageItemWidget();
        }
      }).toList(),
    );
  }
}

class _HomePageBottomNavigationBarNewMessageItemWidget extends StatelessWidget {
  const _HomePageBottomNavigationBarNewMessageItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          goToNewPostStatusPageWithInitial(context);
        },
        child: const Padding(
          padding: FediPadding.allBigPadding,
          child: FediTransparentIcon(FediIcons.plus),
        ),
      );
}

class _HomePageBottomNavigationBarIconItemWidget extends StatelessWidget {
  const _HomePageBottomNavigationBarIconItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String keyStr;
    var tab = Provider.of<HomeTab>(context);

    switch (tab) {
      case HomeTab.timelines:
        keyStr = HomePageBottomNavigationBarWidgetKeys.timelinesTabButton;
        break;
      case HomeTab.notifications:
        keyStr = HomePageBottomNavigationBarWidgetKeys.notificationsTabButton;
        break;
      case HomeTab.chat:
        keyStr = HomePageBottomNavigationBarWidgetKeys.chatTabButton;
        break;
      case HomeTab.account:
        keyStr = HomePageBottomNavigationBarWidgetKeys.accountTabButton;
        break;
    }

    return InkWell(
      onTap: () {
        IHomeBloc.of(context, listen: false).selectTab(tab);
      },
      key: Key(keyStr),
      child: const _HomePageBottomNavigationBarIconWidget(),
    );
  }
}

class _HomePageBottomNavigationBarIconWidget extends StatelessWidget {
  const _HomePageBottomNavigationBarIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tab = Provider.of<HomeTab>(context);
    var homeBloc = IHomeBloc.of(context);

    return StreamBuilder<HomeTab?>(
      stream: homeBloc.selectedTabStream,
      builder: (context, snapshot) {
        var selectedTab = snapshot.data;
        var isSelected = selectedTab == tab;

        var fediUiColorTheme = IFediUiColorTheme.of(context, listen: true);
        var color =
            isSelected ? fediUiColorTheme.primary : fediUiColorTheme.darkGrey;

        const insets = FediPadding.allBigPadding;
        // ignore: no-magic-number
        var additionalOffset = 2.0;
        var badgeOffset = additionalOffset + FediSizes.smallPadding;
        switch (tab) {
          case HomeTab.timelines:
            return DisposableProxyProvider<IHomeBloc, IFediBoolBadgeBloc>(
              update: (context, homeBloc, _) => HomeTimelinesUnreadBadgeBloc(
                homeBloc: homeBloc,
              ),
              child: FediBoolBadgeWidget(
                offset: badgeOffset,
                child: Padding(
                  padding: insets,
                  child: FediTransparentIcon(
                    FediIcons.home,
                    color: color,
                  ),
                ),
              ),
            );
          case HomeTab.notifications:
            return DisposableProvider<IFediBoolBadgeBloc>(
              create: (context) => NotificationUnreadExcludeTypesBoolBadgeBloc(
                filterRepository: IFilterRepository.of(
                  context,
                  listen: false,
                ),
                notificationRepository: INotificationRepository.of(
                  context,
                  listen: false,
                ),
                excludeTypes: <UnifediApiNotificationType>[
                  UnifediApiNotificationType.chatMentionValue,
                ],
              ),
              child: FediBoolBadgeWidget(
                offset: badgeOffset,
                child: Padding(
                  padding: insets,
                  child: FediTransparentIcon(
                    FediIcons.notification,
                    color: color,
                  ),
                ),
              ),
            );
          case HomeTab.chat:
            return DisposableProvider<IFediBoolBadgeBloc>(
              create: (context) => ChatUnreadBadgeBloc(
                conversationChatRepository: IConversationChatRepository.of(
                  context,
                  listen: false,
                ),
                unifediChatRepository: IUnifediChatRepository.of(
                  context,
                  listen: false,
                ),
                chatSettingsBloc: IChatSettingsBloc.of(
                  context,
                  listen: false,
                ),
              ),
              child: FediBoolBadgeWidget(
                offset: badgeOffset,
                child: Padding(
                  padding: insets,
                  child: FediTransparentIcon(FediIcons.chat, color: color),
                ),
              ),
            );
          case HomeTab.account:
            return GestureDetector(
              onLongPress: () {
                showMyAccountActionListBottomSheetDialog(context);
              },
              child: AccountHomeTabIntBadgeBloc.provideToContext(
                context,
                child: FediIntBadgeBlocBoolAdapterProxyProvider(
                  child: FediBoolBadgeWidget(
                    offset: badgeOffset,
                    child: const Padding(
                      padding: insets,
                      child: MyAccountAvatarWidget(),
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
