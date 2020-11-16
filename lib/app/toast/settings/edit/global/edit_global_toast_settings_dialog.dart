import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc_impl.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_widget.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/local/instance_toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalToastSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_toast_settings_title,
    child: DisposableProvider<IToastSettingsBloc>(
      create: (context) => ToastSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstanceToastSettingsLocalPreferencesBloc.of(context,
                listen: false),
        globalLocalPreferencesBloc:
            IGlobalToastSettingsLocalPreferencesBloc.of(context, listen: false),
        forceUseGlobal: true,
      ),
      child:
          DisposableProxyProvider<IToastSettingsBloc, IEditToastSettingsBloc>(
        update: (context, value, previous) => EditToastSettingsBloc(
          toastSettingsBloc: value,
        ),
        child: const EditToastSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
