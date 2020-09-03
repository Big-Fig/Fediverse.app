import 'package:easy_localization/easy_localization.dart';
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
        child: Column(
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
    builder: (context) => MyAccountSettingsPage(),
  );
}
