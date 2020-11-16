import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc_impl.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_widget.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceToastSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_toast_settings_title,
    child: const EditToastSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: (BuildContext context, Widget child) =>
        DisposableProvider<IEditToastSettingsBloc>(
      create: (context) => EditToastSettingsBloc(
        toastSettingsBloc: IToastSettingsBloc.of(
          context,
          listen: false,
        ),
      ),
      child: ProxyProvider<IEditToastSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
  );
}
