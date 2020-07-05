import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_widget.dart';
import 'package:fedi/app/status/scheduled/list/scheduled_status_list_page.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/drawer/fedi_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountHomeTabPageDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FediDrawerWidget(
      headerText: tr("app.account.my.settings.title"),
      child: Column(
        children: [
          MyAccountSettingsWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FediUltraLightGreyDivider(),
          ),
          buildScheduledButton(context)
        ],
      ),
    );
  }

  FediPrimaryFilledTextButton buildScheduledButton(BuildContext context) {
    return FediPrimaryFilledTextButton(
      tr("app.account.my.settings.scheduled_posts"),
      onPressed: () {
        goToScheduledStatusListPage(context);
      },
    );
  }

  const AccountHomeTabPageDrawerWidget();
}
