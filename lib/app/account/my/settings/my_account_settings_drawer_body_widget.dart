import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/status/scheduled/list/scheduled_status_list_page.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSettingsDrawerBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc =
        IMyAccountSettingsBloc.of(context, listen: true);

    return Column(
      children: <Widget>[
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
        FediPrimaryFilledTextButton(
          "Scheduled",
          onPressed: () {
            goToScheduledStatusListPage(context);
          },
        )
      ],
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

  const MyAccountSettingsDrawerBodyWidget();
}
