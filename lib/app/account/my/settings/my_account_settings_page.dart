import 'package:fedi/app/account/my/account_block/my_account_account_block_list_page.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_list_page.dart';
import 'package:fedi/app/account/my/domain_block/list/my_account_domain_block_list_page.dart';
import 'package:fedi/app/account/my/follow_request/my_account_follow_request_list_page.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_widget.dart';
import 'package:fedi/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_page.dart';
import 'package:fedi/app/account/my/statuses/favourited/my_account_favourited_statuses_page.dart';
import 'package:fedi/app/custom_list/list/custom_list_list_page.dart';
import 'package:fedi/app/status/draft/list/draft_status_list_page.dart';
import 'package:fedi/app/status/scheduled/list/scheduled_status_list_page.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_bloc.dart';
import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_bloc_impl.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_account_my_settings_title,
      ),
      body: const Padding(
        padding: FediPadding.allBigPadding,
        child: _MyAccountSettingsBody(),
      ),
    );
  }

  const MyAccountSettingsPage();
}

class _MyAccountSettingsBody extends StatelessWidget {
  const _MyAccountSettingsBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const MyAccountSettingsWidget(),
        const Padding(
          padding: FediPadding.verticalBigPadding,
          child: FediUltraLightGreyDivider(),
        ),
        const _MyAccountSettingsScheduledButton(),
        const FediSmallVerticalSpacer(),
        const _MyAccountSettingsDraftsButton(),
        const FediSmallVerticalSpacer(),
        const _MyAccountSettingsListsButton(),
        const FediSmallVerticalSpacer(),
        const _MyAccountSettingsBookmarkedButton(),
        const FediSmallVerticalSpacer(),
        const _MyAccountSettingsFavouritedButton(),
        const FediSmallVerticalSpacer(),
        const _MyAccountSettingsFollowRequestsButton(),
        const FediSmallVerticalSpacer(),
        const _MyAccountSettingsAccountBlocksButton(),
        const FediSmallVerticalSpacer(),
        const _MyAccountSettingsAccountMutesButton(),
        const FediSmallVerticalSpacer(),
        const _MyAccountSettingsDomainBlocksButton(),
      ],
    );
  }
}

class _MyAccountSettingsScheduledButton extends StatelessWidget {
  const _MyAccountSettingsScheduledButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      S.of(context).app_account_my_settings_action_scheduledPosts,
      onPressed: () {
        goToScheduledStatusListPage(context);
      },
    );
  }
}

class _MyAccountSettingsDraftsButton extends StatelessWidget {
  const _MyAccountSettingsDraftsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      S.of(context).app_account_my_settings_action_draftPosts,
      onPressed: () {
        goToDraftStatusListPage(context);
      },
    );
  }
}

class _MyAccountSettingsListsButton extends StatelessWidget {
  const _MyAccountSettingsListsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      S.of(context).app_account_my_settings_action_lists,
      onPressed: () {
        goToCustomListListPage(context: context);
      },
    );
  }
}

class _MyAccountSettingsBookmarkedButton extends StatelessWidget {
  const _MyAccountSettingsBookmarkedButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      S.of(context).app_account_my_settings_action_bookmarked,
      onPressed: () {
        goToMyAccountBookmarkedStatusesPage(context);
      },
    );
  }
}

class _MyAccountSettingsFavouritedButton extends StatelessWidget {
  const _MyAccountSettingsFavouritedButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      S.of(context).app_account_my_settings_action_favourited,
      onPressed: () {
        goToMyAccountFavouritedStatusesPage(context);
      },
    );
  }
}

class _MyAccountSettingsFollowRequestsButton extends StatelessWidget {
  const _MyAccountSettingsFollowRequestsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      S.of(context).app_account_my_settings_action_followRequests,
      onPressed: () {
        goToMyAccountFollowRequestListPage(context);
      },
    );
  }
}

class _MyAccountSettingsAccountBlocksButton extends StatelessWidget {
  const _MyAccountSettingsAccountBlocksButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      S.of(context).app_account_my_settings_action_accountBlocks,
      onPressed: () {
        goToMyAccountAccountBlockListPage(context);
      },
    );
  }
}

class _MyAccountSettingsAccountMutesButton extends StatelessWidget {
  const _MyAccountSettingsAccountMutesButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      S.of(context).app_account_my_settings_action_accountMutes,
      onPressed: () {
        goToMyAccountAccountMuteListPage(context);
      },
    );
  }
}

class _MyAccountSettingsDomainBlocksButton extends StatelessWidget {
  const _MyAccountSettingsDomainBlocksButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      S.of(context).app_account_my_settings_action_domainBlocks,
      onPressed: () {
        goToMyAccountDomainBlockListPage(context);
      },
    );
  }
}

void goMyAccountSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountSettingsPageRoute(),
  );
}

MaterialPageRoute createMyAccountSettingsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<ICurrentFediUiThemeChooserBloc>(
      create: (context) => CurrentFediUiThemeChooserBloc(
        currentFediUiThemeBloc:
            ICurrentFediUiThemeBloc.of(context, listen: false),
        lightTheme: lightFediUiTheme,
        darkTheme: darkFediUiTheme,
      ),
      child: const MyAccountSettingsPage(),
    ),
  );
}
