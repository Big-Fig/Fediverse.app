import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_visibility_field_form_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSettingsWidget extends StatelessWidget {
  const MyAccountSettingsWidget();

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc =
        IMyAccountSettingsBloc.of(context, listen: true);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FormBoolFieldFormRowWidget(
          label: tr("app.account.my.settings.field.websockets_enabled.label"),
          desc: tr(
              "app.account.my.settings.field.websockets_enabled.description"),
          field: myAccountSettingsBloc.isRealtimeWebSocketsEnabledFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: tr("app.account.my.settings.field.new_chats_enabled.label"),
          desc:
              tr("app.account.my.settings.field.new_chats_enabled.description"),
          field: myAccountSettingsBloc.isNewChatsEnabledFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: tr("app.account.my.settings.field.always_show_spoiler.label"),
          desc: null,
          field: myAccountSettingsBloc.isAlwaysShowSpoilerFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: tr("app.account.my.settings.field.always_show_nsfw.label"),
          desc:
              null,
          field: myAccountSettingsBloc.isAlwaysShowNsfwFieldBloc,
        ),
        FormPleromaVisibilityFieldFormRowWidget(
          label: tr("app.account.my.settings.field.default_visibility.label"),
          desc: null,
          field: myAccountSettingsBloc.defaultVisibilityFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label:
              tr("app.account.my.settings.field.media_nsfw_by_default.label"),
          desc: null,
          field: myAccountSettingsBloc.markMediaNsfwByDefaultFieldBloc,
        )
      ],
    );
  }
}
