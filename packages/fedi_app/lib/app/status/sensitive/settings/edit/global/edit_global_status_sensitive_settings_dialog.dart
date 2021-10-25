import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc_impl.dart';
import 'package:fedi_app/app/status/sensitive/settings/edit/edit_status_sensitive_settings_widget.dart';
import 'package:fedi_app/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_bloc_impl.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalStatusSensitiveSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_status_sensitive_settings_title,
    child: DisposableProvider<IStatusSensitiveSettingsBloc>(
      create: (context) => StatusSensitiveSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstanceStatusSensitiveSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        globalLocalPreferencesBloc:
            IGlobalStatusSensitiveSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
      ),
      child: DisposableProxyProvider<IStatusSensitiveSettingsBloc,
          IEditStatusSensitiveSettingsBloc>(
        update: (context, value, previous) => EditStatusSensitiveSettingsBloc(
          isGlobalForced: true,
          statusSensitiveSettingsBloc: value,
          globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
          isEnabled: true,
        ),
        child: const EditStatusSensitiveSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
