import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/chat/unread/chat_unread_badge_bloc_impl.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/app/home/home_timelines_unread_badge_bloc_impl.dart';
import 'package:fedi/app/home/tab/account/badge/account_home_tab_int_badge_bloc_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/unread/notification_unread_exclude_types_bool_badge_bloc_impl.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_widget.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc_bool_adapter_proxy_provider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/icon/fedi_transparent_icon.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
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
        goToNewPostStatusPageWithInitial(context);
      },
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: const FediTransparentIcon(FediIcons.plus),
      ));

  Widget buildTabNavBarItem(
          BuildContext context, IHomeBloc homeBloc, HomeTab tab) =>
      StreamBuilder<HomeTab?>(
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
    var fediUiColorTheme = IFediUiColorTheme.of(context, listen: true);
    var color =
        isSelected ? fediUiColorTheme.primary : fediUiColorTheme.darkGrey;

    // todo: refactor UI
    const insets = FediPadding.allBigPadding;
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
            excludeTypes: <PleromaNotificationType>[
              PleromaNotificationType.pleromaChatMention
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
            pleromaChatRepository: IPleromaChatRepository.of(
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
                child: Padding(
                  padding: insets,
                  child: const MyAccountAvatarWidget(),
                ),
              ),
            ),
          ),
        );
    }

  }
}
