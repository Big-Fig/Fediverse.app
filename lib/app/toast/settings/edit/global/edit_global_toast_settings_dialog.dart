import 'package:fedi/app/access/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc_impl.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_widget.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc_impl.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalToastSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_toast_settings_title,
    child: _buildBody(),
  );
}

DisposableProvider<IToastSettingsBloc> _buildBody() {
  return DisposableProvider<IToastSettingsBloc>(
    create: (context) => ToastSettingsBloc(
      instanceLocalPreferencesBloc:
          IInstanceToastSettingsLocalPreferenceBloc.of(context, listen: false),
      globalLocalPreferencesBloc:
          IGlobalToastSettingsLocalPreferenceBloc.of(context, listen: false),
    ),
    child: DisposableProxyProvider<IToastSettingsBloc, IEditToastSettingsBloc>(
      update: (context, value, previous) => EditToastSettingsBloc(
        isGlobalForced: true,
        toastSettingsBloc: value,
        globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
        isEnabled: true,
        currentInstance: ICurrentUnifediApiAccessBloc.of(context, listen: false)
            .currentInstance,
      ),
      child: const EditToastSettingsWidget(
        shrinkWrap: true,
      ),
    ),
  );
}
