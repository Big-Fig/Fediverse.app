import 'package:fedi/analytics/app/app_analytics_bloc.dart';
import 'package:fedi/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_page.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/custom_list/list/custom_list_list_page.dart';
import 'package:fedi/app/home/tab/account/menu/account_home_tab_menu_account_sub_page.dart';
import 'package:fedi/app/package_info/package_info_helper.dart';
import 'package:fedi/app/settings/global/list/global_settings_list_page.dart';
import 'package:fedi/app/settings/instance/list/instance_settings_list_page.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/in_app_review/in_app_review_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _GlobalSettingsHomeTabMenuDialogBodySettingsItemWidget(),
        const _InstanceSettingsHomeTabMenuDialogBodySettingsItemWidget(),
        const _AccountHomeTabMenuDialogBodyAccountItemWidget(),
        const _BookmarksHomeTabMenuDialogBodyBookmarksItemWidget(),
        const _ListsHomeTabMenuDialogBodyListsItemWidget(),
        const _RateAppHomeTabMenuDialogBodyListsItemWidget(),
      ],
    );
  }
}

class _AccountHomeTabMenuDialogBodyAccountItemWidget extends StatelessWidget {
  const _AccountHomeTabMenuDialogBodyAccountItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goAccountHomeTabMenuAccountSubPage(context);
      },
      child: _AccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.account,
        text: S.of(context).app_account_home_tab_menu_action_account,
      ),
    );
  }
}

class _GlobalSettingsHomeTabMenuDialogBodySettingsItemWidget
    extends StatelessWidget {
  const _GlobalSettingsHomeTabMenuDialogBodySettingsItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToGlobalSettingsPage(context);
      },
      child: _AccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.settings,
        text: S.of(context).app_account_home_tab_menu_action_global_settings,
      ),
    );
  }
}

class _InstanceSettingsHomeTabMenuDialogBodySettingsItemWidget
    extends StatelessWidget {
  const _InstanceSettingsHomeTabMenuDialogBodySettingsItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);
    return InkWell(
      onTap: () {
        goToInstanceSettingsPage(context);
      },
      child: _AccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.instance,
        text: S.of(context).app_account_home_tab_menu_action_instance_settings(
              currentAuthInstanceBloc.currentInstance.userAtHost,
            ),
      ),
    );
  }
}

class _BookmarksHomeTabMenuDialogBodyBookmarksItemWidget
    extends StatelessWidget {
  const _BookmarksHomeTabMenuDialogBodyBookmarksItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToMyAccountBookmarkedStatusesPage(context);
      },
      child: _AccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.unbookmark,
        text: S.of(context).app_account_home_tab_menu_action_bookmarks,
      ),
    );
  }
}

class _ListsHomeTabMenuDialogBodyListsItemWidget extends StatelessWidget {
  const _ListsHomeTabMenuDialogBodyListsItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToCustomListListPage(context);
      },
      child: _AccountHomeTabMenuDialogBodyItem(
        iconData: FediIcons.lists,
        text: S.of(context).app_account_home_tab_menu_action_lists,
      ),
    );
  }
}

class _RateAppHomeTabMenuDialogBodyListsItemWidget extends StatelessWidget {
  const _RateAppHomeTabMenuDialogBodyListsItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appAnalyticsBloc = IAppAnalyticsBloc.of(context);

    if (appAnalyticsBloc.isAppRated) {
      return const SizedBox.shrink();
    } else {
      return FutureBuilder(
        future: FediPackageInfoHelper.isProdPackageId(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          var isProdPackageId = snapshot.data;

          if (isProdPackageId == true) {
            return InkWell(
              onTap: () {
                var inAppReviewBloc = IInAppReviewBloc.of(context, listen: false);
                inAppReviewBloc.openStoreListing();
              },
              child: _AccountHomeTabMenuDialogBodyItem(
                iconData: FediIcons.instance,
                text: S.of(context).app_account_home_tab_menu_action_rateApp,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );
    }
  }
}

class _AccountHomeTabMenuDialogBodyItem extends StatelessWidget {
  const _AccountHomeTabMenuDialogBodyItem({
    Key key,
    @required this.iconData,
    @required this.text,
  }) : super(key: key);

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.allBigPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: IFediUiColorTheme.of(context).darkGrey,
          ),
          const FediBigHorizontalSpacer(),
          Text(
            text,
            style: IFediUiTextTheme.of(context).bigPrimary,
          ),
        ],
      ),
    );
  }
}
