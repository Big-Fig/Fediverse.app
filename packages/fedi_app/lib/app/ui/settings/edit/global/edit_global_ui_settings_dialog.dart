import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi_app/app/ui/settings/edit/edit_ui_settings_bloc.dart';
import 'package:fedi_app/app/ui/settings/edit/edit_ui_settings_bloc_impl.dart';
import 'package:fedi_app/app/ui/settings/edit/edit_ui_settings_widget.dart';
import 'package:fedi_app/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi_app/app/ui/theme/available_fedi_ui_themes.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalUiSettingsDialog({
  required BuildContext context,
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
        isEnabled: true,
        availableThemes: availableThemes,
      ),
      child: const EditUiSettingsWidget(
        shrinkWrap: true,
      ),
    ),
  );
}
