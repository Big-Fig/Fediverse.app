import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/app/ui/settings/edit/edit_ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/edit/edit_ui_settings_bloc_impl.dart';
import 'package:fedi/app/ui/settings/edit/edit_ui_settings_widget.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/current/form/current_fedi_ui_theme_value_form_field_bloc.dart';
import 'package:fedi/app/ui/theme/current/form/current_fedi_ui_theme_value_form_field_bloc_impl.dart';
import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalUiSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_ui_settings_title,
    child: DisposableProvider<IEditUiSettingsBloc>(
      create: (context) => EditUiSettingsBloc(
        uiSettingBloc: IUiSettingsBloc.of(
          context,
          listen: false,
        ),
        enabled: true,
      ),
      child: DisposableProvider<ICurrentFediUiThemeValueFormFieldBloc>(
        create: (context) {
          return CurrentFediUiThemeValueFormFieldBloc(
            currentFediUiThemeBloc:
                ICurrentFediUiThemeBloc.of(context, listen: false),
            lightTheme: lightFediUiTheme,
            darkTheme: darkFediUiTheme,
          );
        },
        child: const EditUiSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
