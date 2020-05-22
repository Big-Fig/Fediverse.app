import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/status/scheduled/list/scheduled_status_list_page.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSettingsDrawerBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc =
        IMyAccountSettingsBloc.of(context, listen: true);

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(width: double.infinity, child: buildHeaderWidget(context)),
          buildOptionListTile(
              AppLocalizations.of(context)
                  .tr("app.account.my.settings.field.websockets_enabled.label"),
              AppLocalizations.of(context)
                  .tr("app.account.my.settings.field.websockets_enabled"
                      ".description"),
              myAccountSettingsBloc.isRealtimeWebSocketsEnabledStream,
              myAccountSettingsBloc.isRealtimeWebSocketsEnabled,
              myAccountSettingsBloc.changeIsRealtimeWebSocketsEnabled),
          buildOptionListTile(
              AppLocalizations.of(context)
                  .tr("app.account.my.settings.field.new_chats_enabled.label"),
              AppLocalizations.of(context)
                  .tr("app.account.my.settings.field.new_chats_enabled"
                      ".description"),
              myAccountSettingsBloc.isNewChatsEnabledStream,
              myAccountSettingsBloc.isNewChatsEnabled,
              myAccountSettingsBloc.changeIsNewChatsEnabled),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FediUltraLightGreyDivider(),
          ),
          FediPrimaryFilledTextButton(
            AppLocalizations.of(context)
                .tr("app.account.my.settings.scheduled_posts"),
            onPressed: () {
              goToScheduledStatusListPage(context);
            },
          )
        ],
      ),
    );
  }

  ListTile buildOptionListTile(
      String optionLabel,
      String optionDescription,
      Stream<bool> optionStream,
      bool optionValue,
      onOptionChanged(bool value)) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Text(
            optionLabel,
          ),
          const Spacer(),
          StreamBuilder<bool>(
              stream: optionStream.distinct(),
              initialData: optionValue,
              builder: (context, snapshot) {
                var value = snapshot.data ?? false;
                return Switch(
                  value: value,
                  onChanged: onOptionChanged,
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: Colors.blue,
                );
              }),
        ],
      ),
      subtitle: optionDescription != null ? Text(optionDescription) : null,
    );
  }

  Container buildHeaderWidget(BuildContext context) {
    return Container(
      height: 110,
      child: DrawerHeader(
        child: Text(
          AppLocalizations.of(context).tr("app.account.my.settings.title"),
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: FediColors.primaryColor,
        ),
      ),
    );
  }

  const MyAccountSettingsDrawerBodyWidget();
}
