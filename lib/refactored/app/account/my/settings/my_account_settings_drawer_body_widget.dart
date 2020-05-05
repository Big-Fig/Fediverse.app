import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/my/settings/my_account_settings_bloc.dart';
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
          Spacer(),
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
}
