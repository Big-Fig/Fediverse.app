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
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CurrentFediUiThemeChooserFormRowWidget(),
          const _MyAccountSettingsWebSocketsFieldWidget(),
          const _MyAccountSettingsShowSpoilerFieldWidget(),
          const _MyAccountSettingsShowNsfwSpoilerWidget(),
          const _MyAccountSettingsDefaultVisibilityFieldWidget(),
          const _MyAccountSettingsMediaNsfwByDefaultFieldWidget(),
          const _MyAccountSettingsMediaAutoInitFieldWidget(),
          const _MyAccountSettingsMediaAutoPlayFieldWidget(),
        ],
      );
}

class _MyAccountSettingsMediaAutoPlayFieldWidget extends StatelessWidget {
  const _MyAccountSettingsMediaAutoPlayFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc = IMyAccountSettingsBloc.of(context);

    return FormBoolFieldFormRowWidget(
      label: S.of(context).app_account_my_settings_field_mediaAutoPlay_label,
      desc: null,
      field: myAccountSettingsBloc.mediaAutoPlayFieldBloc,
    );
  }
}

class _MyAccountSettingsMediaAutoInitFieldWidget extends StatelessWidget {
  const _MyAccountSettingsMediaAutoInitFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc = IMyAccountSettingsBloc.of(context);

    return FormBoolFieldFormRowWidget(
      label: S.of(context).app_account_my_settings_field_mediaAutoInit_label,
      desc: null,
      field: myAccountSettingsBloc.mediaAutoInitFieldBloc,
    );
  }
}

class _MyAccountSettingsMediaNsfwByDefaultFieldWidget extends StatelessWidget {
  const _MyAccountSettingsMediaNsfwByDefaultFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc = IMyAccountSettingsBloc.of(context);

    return FormBoolFieldFormRowWidget(
      label:
          S.of(context).app_account_my_settings_field_mediaNsfwByDefault_label,
      desc: null,
      field: myAccountSettingsBloc.markMediaNsfwByDefaultFieldBloc,
    );
  }
}

class _MyAccountSettingsDefaultVisibilityFieldWidget extends StatelessWidget {
  const _MyAccountSettingsDefaultVisibilityFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc = IMyAccountSettingsBloc.of(context);

    return FormPleromaVisibilityFieldFormRowWidget(
      label:
          S.of(context).app_account_my_settings_field_defaultVisibility_label,
      desc: null,
      field: myAccountSettingsBloc.defaultVisibilityFieldBloc,
      displayIcon: false,
    );
  }
}

class _MyAccountSettingsShowNsfwSpoilerWidget extends StatelessWidget {
  const _MyAccountSettingsShowNsfwSpoilerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc = IMyAccountSettingsBloc.of(context);

    return FormBoolFieldFormRowWidget(
      label: S.of(context).app_account_my_settings_field_alwaysShowNsfw_label,
      desc: null,
      field: myAccountSettingsBloc.isAlwaysShowNsfwFieldBloc,
    );
  }
}

class _MyAccountSettingsShowSpoilerFieldWidget extends StatelessWidget {
  const _MyAccountSettingsShowSpoilerFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc = IMyAccountSettingsBloc.of(context);

    return FormBoolFieldFormRowWidget(
      label:
          S.of(context).app_account_my_settings_field_alwaysShowSpoiler_label,
      desc: null,
      field: myAccountSettingsBloc.isAlwaysShowSpoilerFieldBloc,
    );
  }
}

class _MyAccountSettingsWebSocketsFieldWidget extends StatelessWidget {
  const _MyAccountSettingsWebSocketsFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc = IMyAccountSettingsBloc.of(context);

    return FormBoolFieldFormRowWidget(
      label:
          S.of(context).app_account_my_settings_field_websocketsEnabled_label,
      desc: S
          .of(context)
          .app_account_my_settings_field_websocketsEnabled_description,
      field: myAccountSettingsBloc.isRealtimeWebSocketsEnabledFieldBloc,
    );
  }
}
