import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_list_page.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_list_page.dart';
import 'package:fedi/app/account/my/domain_block/my_account_domain_block_list_page.dart';
import 'package:fedi/app/account/my/follow_request/my_account_follow_request_list_page.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_widget.dart';
import 'package:fedi/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_page.dart';
import 'package:fedi/app/account/my/statuses/favourited/my_account_favourited_statuses_page.dart';
import 'package:fedi/app/custom_list/list/custom_list_list_page.dart';
import 'package:fedi/app/status/draft/draft_status_list_page.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.account.my.settings.title"),
      ),
      body: Padding(
        padding: FediPadding.allBigPadding,
        child: ListView(
          children: [
            MyAccountSettingsWidget(),
            Padding(
              padding: FediPadding.verticalBigPadding,
              child: FediUltraLightGreyDivider(),
            ),
            buildScheduledButton(context),
            FediSmallVerticalSpacer(),
            buildDraftsButton(context),
            FediSmallVerticalSpacer(),
            buildListsButton(context),
            FediSmallVerticalSpacer(),
            buildBookmarkedButton(context),
            FediSmallVerticalSpacer(),
            buildFavouritedButton(context),
            FediSmallVerticalSpacer(),
            buildFollowRequestsButton(context),
            FediSmallVerticalSpacer(),
            buildAccountBlocksButton(context),
            FediSmallVerticalSpacer(),
            buildAccountMutesButton(context),
            FediSmallVerticalSpacer(),
            buildDomainBlocksButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildScheduledButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.action.scheduled_posts"),
      onPressed: () {
        goToScheduledStatusListPage(context);
      },
    );
  }

  Widget buildDraftsButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.action.draft_posts"),
      onPressed: () {
        goToDraftStatusListPage(context);
      },
    );
  }

  Widget buildListsButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.action.lists"),
      onPressed: () {
        goToCustomListListPage(context: context);
      },
    );
  }

  Widget buildBookmarkedButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.action.bookmarked"),
      onPressed: () {
        goToMyAccountBookmarkedStatusesPage(context);
      },
    );
  }

  Widget buildFavouritedButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.action.favourited"),
      onPressed: () {
        goToMyAccountFavouritedStatusesPage(context);
      },
    );
  }

  Widget buildFollowRequestsButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.action.follow_requests"),
      onPressed: () {
        goToMyAccountFollowRequestListPage(context);
      },
    );
  }

  Widget buildAccountBlocksButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.action.account_blocks"),
      onPressed: () {
        goToMyAccountAccountBlockListPage(context);
      },
    );
  }

  Widget buildAccountMutesButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.action.account_mutes"),
      onPressed: () {
        goToMyAccountAccountMuteListPage(context);
      },
    );
  }

  Widget buildDomainBlocksButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.action.domain_blocks"),
      onPressed: () {
        goToMyAccountDomainBlockListPage(context);
      },
    );
  }

  const MyAccountSettingsPage();
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
        child: MyAccountSettingsPage()),
  );
}
