import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_widget.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/local/instance_status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalStatusSensitiveSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_status_sensitive_settings_title,
    child: DisposableProvider<IStatusSensitiveSettingsBloc>(
      create: (context) => StatusSensitiveSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstanceStatusSensitiveSettingsLocalPreferencesBloc.of(context,
                listen: false),
        globalLocalPreferencesBloc:
            IGlobalStatusSensitiveSettingsLocalPreferencesBloc.of(context,
                listen: false),
        forceUseGlobal: true,
      ),
      child: DisposableProxyProvider<IStatusSensitiveSettingsBloc,
          IEditStatusSensitiveSettingsBloc>(
        update: (context, value, previous) => EditStatusSensitiveSettingsBloc(
          statusSensitiveSettingsBloc: value,
        ),
        child: const EditStatusSensitiveSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
