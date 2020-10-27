import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_pleroma_visibility_field_form_row_widget.dart';
import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_form_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
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
        CurrentFediUiThemeChooserFormRowWidget(),
        FormBoolFieldFormRowWidget(
          label: S
              .of(context)
              .app_account_my_settings_field_websocketsEnabled_label,
          desc: S
              .of(context)
              .app_account_my_settings_field_websocketsEnabled_description,
          field: myAccountSettingsBloc.isRealtimeWebSocketsEnabledFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: S
              .of(context)
              .app_account_my_settings_field_new_chatsEnabled_label,
          desc: S
              .of(context)
              .app_account_my_settings_field_new_chatsEnabled_description,
          field: myAccountSettingsBloc.isNewChatsEnabledFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: S
              .of(context)
              .app_account_my_settings_field_alwaysShowSpoiler_label,
          desc: null,
          field: myAccountSettingsBloc.isAlwaysShowSpoilerFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: S
              .of(context)
              .app_account_my_settings_field_alwaysShowNsfw_label,
          desc: null,
          field: myAccountSettingsBloc.isAlwaysShowNsfwFieldBloc,
        ),
        FormPleromaVisibilityFieldFormRowWidget(
          label:S
              .of(context)
              .app_account_my_settings_field_defaultVisibility_label,
          desc: null,
          field: myAccountSettingsBloc.defaultVisibilityFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label:
          S
              .of(context)
              .app_account_my_settings_field_mediaNsfwByDefault_label,
          desc: null,
          field: myAccountSettingsBloc.markMediaNsfwByDefaultFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label:S
              .of(context)
              .app_account_my_settings_field_mediaAutoInit_label,
          desc: null,
          field: myAccountSettingsBloc.mediaAutoInitFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label:S
              .of(context)
              .app_account_my_settings_field_mediaAutoPlay_label,
          desc: null,
          field: myAccountSettingsBloc.mediaAutoPlayFieldBloc,
        ),
      ],
    );
  }
}
