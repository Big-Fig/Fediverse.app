import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_widget.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceStatusSensitiveSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_status_sensitive_settings_title,
    child: const EditStatusSensitiveSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: (BuildContext context, Widget child) =>
        DisposableProvider<IEditStatusSensitiveSettingsBloc>(
      create: (context) => EditStatusSensitiveSettingsBloc(
        statusSensitiveSettingsBloc: IStatusSensitiveSettingsBloc.of(
          context,
          listen: false,
        ),
      ),
      child: ProxyProvider<IEditStatusSensitiveSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
  );
}
