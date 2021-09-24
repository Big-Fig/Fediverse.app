import 'package:fedi/app/about/about_page.dart';
import 'package:fedi/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_page.dart';
import 'package:fedi/app/access/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/custom_list/list/custom_list_list_page.dart';
import 'package:fedi/app/home/tab/account/menu/account_home_tab_menu_dialog_keys.dart';
import 'package:fedi/app/home/tab/account/menu/actions/account_home_tab_menu_actions_page.dart';
import 'package:fedi/app/home/tab/account/menu/actions/badge/account_home_tab_menu_actions_int_badge_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/badge/instance_announcement_count_int_badge_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/list/instance_announcement_list_page.dart';
import 'package:fedi/app/instance/details/local/local_instance_details_page.dart';
import 'package:fedi/app/settings/global/list/global_settings_list_page.dart';
import 'package:fedi/app/settings/instance/list/instance_settings_list_page.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_widget.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/in_app_review/ask/local_preferences/ask_in_app_review_local_preference_bloc.dart';
import 'package:fedi/in_app_review/in_app_review_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fediverse_api/fediverse_api.dart';

void showAccountHomeTabMenuDialog(BuildContext context) {
  showFediModalBottomSheetDialog(
    context: context,
    child: const AccountHomeTabMenuDialogBodyWidget(),
  );
}

class AccountHomeTabMenuDialogBodyWidget extends StatelessWidget {
  const AccountHomeTabMenuDialogBodyWidget();

  @override
  Widget build(BuildContext context) {
    var configService = IConfigService.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _GlobalSettingsHomeTabMenuDialogBodySettingsItemWidget(
          key: Key(
            AccountHomeTabMenuDialogKeys
                .globalSettingsHomeTabMenuDialogBodySettingsItemWidget,
          ),
        ),
        const _InstanceSettingsHomeTabMenuDialogBodySettingsItemWidget(),
        const _AccountHomeTabMenuDialogBodyInstanceItemWidget(),
        const _AccountHomeTabMenuDialogBodyAccountItemWidget(
          key: Key(
            AccountHomeTabMenuDialogKeys
                .accountHomeTabMenuDialogBodyAccountItemWidget,
          ),
        ),
        const _BookmarksHomeTabMenuDialogBodyBookmarksItemWidget(),
        const _ListsHomeTabMenuDialogBodyListsItemWidget(),
        const _AnnouncementsHomeTabMenuDialogBodyListsItemWidget(),
        if (configService.askReviewEnabled)
          const _RateAppHomeTabMenuDialogBodyListsItemWidget(),
        const _AboutHomeTabMenuDialogBodyListsItemWidget(),
      ],
    );
  }
}

class _AccountHomeTabMenuDialogBodyAccountItemWidget extends StatelessWidget {
  const _AccountHomeTabMenuDialogBodyAccountItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goAccountHomeTabMenuActionsPage(context);
      },
      child: AccountHomeTabMenuActionsIntBadgeBloc.provideToContext(
        context,
        child: _AccountHomeTabMenuDialogBodyItem(
          iconWidget: FediIntBadgeWidget(
            offset: 0.0,
            child: _AccountHomeTabMenuDialogBodyItemIcon(
              iconData: FediIcons.account,
            ),
          ),
          textWidget: _AccountHomeTabMenuDialogBodyItemText(
            text: S.of(context).app_account_home_tab_menu_action_account,
          ),
        ),
      ),
    );
  }
}

class _AccountHomeTabMenuDialogBodyInstanceItemWidget extends StatelessWidget {
  const _AccountHomeTabMenuDialogBodyInstanceItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentInstanceUrlHost =
        ICurrentUnifediApiAccessBloc.of(context, listen: false)
            .currentInstance!
            .urlHost;

    return InkWell(
      onTap: () {
        goToLocalInstanceDetailsPage(context);
      },
      child: _SimpleAccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.instance,
        text: S.of(context).app_account_action_instanceDetails(
              currentInstanceUrlHost,
            ),
      ),
    );
  }
}

class _GlobalSettingsHomeTabMenuDialogBodySettingsItemWidget
    extends StatelessWidget {
  const _GlobalSettingsHomeTabMenuDialogBodySettingsItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToGlobalSettingsPage(context);
      },
      child: _SimpleAccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.settings,
        text: S.of(context).app_account_home_tab_menu_action_global_settings,
      ),
    );
  }
}

class _InstanceSettingsHomeTabMenuDialogBodySettingsItemWidget
    extends StatelessWidget {
  const _InstanceSettingsHomeTabMenuDialogBodySettingsItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(context);

    return InkWell(
      onTap: () {
        goToInstanceSettingsPage(context);
      },
      child: _SimpleAccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.instance,
        text: S.of(context).app_account_home_tab_menu_action_instance_settings(
              currentUnifediApiAccessBloc.currentInstance!.userAtHost,
            ),
      ),
    );
  }
}

class _BookmarksHomeTabMenuDialogBodyBookmarksItemWidget
    extends StatelessWidget {
  const _BookmarksHomeTabMenuDialogBodyBookmarksItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToMyAccountBookmarkedStatusesPage(context);
      },
      child: _SimpleAccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.unbookmark,
        text: S.of(context).app_account_home_tab_menu_action_bookmarks,
      ),
    );
  }
}

class _ListsHomeTabMenuDialogBodyListsItemWidget extends StatelessWidget {
  const _ListsHomeTabMenuDialogBodyListsItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToCustomListListPage(context);
      },
      child: _SimpleAccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.lists,
        text: S.of(context).app_account_home_tab_menu_action_lists,
      ),
    );
  }
}

class _AnnouncementsHomeTabMenuDialogBodyListsItemWidget
    extends StatelessWidget {
  const _AnnouncementsHomeTabMenuDialogBodyListsItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToInstanceAnnouncementListPage(context);
      },
      child: InstanceAnnouncementCountIntBadgeBloc.provideToContext(
        context,
        child: _AccountHomeTabMenuDialogBodyItem(
          iconWidget: FediIntBadgeWidget(
            offset: 0.0,
            child: _AccountHomeTabMenuDialogBodyItemIcon(
              iconData: FediIcons.message,
            ),
          ),
          textWidget: _AccountHomeTabMenuDialogBodyItemText(
            text: S
                .of(context)
                .app_account_home_tab_menu_action_instance_announcements,
          ),
        ),
      ),
    );
  }
}

class _AboutHomeTabMenuDialogBodyListsItemWidget extends StatelessWidget {
  const _AboutHomeTabMenuDialogBodyListsItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToAboutPage(context: context);
      },
      child: InstanceAnnouncementCountIntBadgeBloc.provideToContext(
        context,
        child: _AccountHomeTabMenuDialogBodyItem(
          iconWidget: FediIntBadgeWidget(
            offset: 0.0,
            child: _AccountHomeTabMenuDialogBodyItemIcon(
              iconData: FediIcons.info,
            ),
          ),
          textWidget: _AccountHomeTabMenuDialogBodyItemText(
            text: S
                .of(context)
                .app_account_home_tab_menu_action_instance_aboutApp,
          ),
        ),
      ),
    );
  }
}

class _RateAppHomeTabMenuDialogBodyListsItemWidget extends StatelessWidget {
  const _RateAppHomeTabMenuDialogBodyListsItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var askInAppReviewLocalPreferenceBloc =
        Provider.of<IAskInAppReviewLocalPreferenceBloc>(context);

    var configService = IConfigService.of(context);

    if (askInAppReviewLocalPreferenceBloc.value) {
      return const SizedBox.shrink();
    } else {
      if (configService.askReviewEnabled) {
        return InkWell(
          onTap: () {
            var inAppReviewBloc = IInAppReviewBloc.of(context, listen: false);
            inAppReviewBloc.openStoreListing();
          },
          child: _SimpleAccountHomeTabMenuDialogBodyItem(
            iconData: FediIcons.instance,
            text: S.of(context).app_account_home_tab_menu_action_rateApp,
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    }
  }
}

class _SimpleAccountHomeTabMenuDialogBodyItem extends StatelessWidget {
  const _SimpleAccountHomeTabMenuDialogBodyItem({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return _AccountHomeTabMenuDialogBodyItem(
      iconWidget: _AccountHomeTabMenuDialogBodyItemIcon(
        iconData: iconData,
      ),
      textWidget: _AccountHomeTabMenuDialogBodyItemText(
        text: text,
      ),
    );
  }
}

class _AccountHomeTabMenuDialogBodyItem extends StatelessWidget {
  const _AccountHomeTabMenuDialogBodyItem({
    Key? key,
    required this.iconWidget,
    required this.textWidget,
  }) : super(key: key);

  final Widget iconWidget;
  final Widget textWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.allSmallPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconWidget,
          const FediBigHorizontalSpacer(),
          textWidget,
        ],
      ),
    );
  }
}

class _AccountHomeTabMenuDialogBodyItemText extends StatelessWidget {
  const _AccountHomeTabMenuDialogBodyItemText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: IFediUiTextTheme.of(context).bigPrimary,
    );
  }
}

class _AccountHomeTabMenuDialogBodyItemIcon extends StatelessWidget {
  const _AccountHomeTabMenuDialogBodyItemIcon({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.allSmallPadding,
      child: Icon(
        iconData,
        color: IFediUiColorTheme.of(context).darkGrey,
      ),
    );
  }
}
