import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/form/form_field_form_bool_field_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc =
        IMyAccountSettingsBloc.of(context, listen: true);

    return Column(
      children: [
        FormFieldFormBoolFieldRowWidget(
          label: tr("app.account.my.settings.field.websockets_enabled.label"),
          desc: tr(
              "app.account.my.settings.field.websockets_enabled.description"),
          field: myAccountSettingsBloc.isRealtimeWebSocketsEnabledFieldBloc,
        ),
        FormFieldFormBoolFieldRowWidget(
          label: tr("app.account.my.settings.field.new_chats_enabled.label"),
          desc:
              tr("app.account.my.settings.field.new_chats_enabled.description"),
          field: myAccountSettingsBloc.isNewChatsEnabledFieldBloc,
        ),
      ],
    );
  }

  const MyAccountSettingsWidget();
}
