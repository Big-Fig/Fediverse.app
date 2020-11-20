import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc_impl.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_widget.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_dialog.dart';
import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_bloc.dart';
import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_bloc_impl.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditInstancePushSettingsDialog({
  @required BuildContext context,
}) {
  showEditInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_push_settings_title,
    child: DisposableProvider<IEditPushSettingsBloc>(
      create: (context) => EditPushSettingsBloc(
        pushSettingsBloc: IPushSettingsBloc.of(
          context,
          listen: false,
        ),
        enabled: true,
      ),
      child: DisposableProvider<ICurrentFediUiThemeChooserBloc>(
        create: (context) {
          return CurrentFediUiThemeChooserBloc(
            currentFediUiThemeBloc:
                ICurrentFediUiThemeBloc.of(context, listen: false),
            lightTheme: lightFediUiTheme,
            darkTheme: darkFediUiTheme,
          );
        },
        child: Column(
          children: [
            const EditPushSettingsWidget(
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    ),
  );
}
