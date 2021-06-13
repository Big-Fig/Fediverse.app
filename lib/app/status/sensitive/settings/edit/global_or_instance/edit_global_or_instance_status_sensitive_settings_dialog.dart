import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_widget.dart';
import 'package:fedi/app/status/sensitive/settings/edit/global/edit_global_status_sensitive_settings_dialog.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceStatusSensitiveSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_status_sensitive_settings_title,
    child: EditStatusSensitiveSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      required BuildContext context,
      required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditStatusSensitiveSettingsBloc>(
          update: (context, globalOrInstanceType, previous) {
            var isUseGlobalSettingsFormBoolFieldBloc =
            ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(context, listen: false);

            var isEnabled =
                globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
            var editStatusSensitiveSettingsBloc = EditStatusSensitiveSettingsBloc(
              isGlobalForced: false,
              statusSensitiveSettingsBloc: IStatusSensitiveSettingsBloc.of(
                context,
                listen: false,
              ),
              globalOrInstanceSettingsType: globalOrInstanceType,
              isEnabled: isEnabled,
            );

            editStatusSensitiveSettingsBloc.addDisposable(
              streamSubscription:
              isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
                    (isUseGlobalSettings) {
                  editStatusSensitiveSettingsBloc.changeEnabled(!isUseGlobalSettings!);
                },
              ),
            );

            return editStatusSensitiveSettingsBloc;
          },
          child: ProxyProvider<IEditStatusSensitiveSettingsBloc,
              IEditGlobalOrInstanceSettingsBloc>(
            update: (context, value, update) => value,
            child: child,
          ),
        ),
    globalOrInstanceSettingsBloc: IStatusSensitiveSettingsBloc.of(
      context,
      listen: false,
    ),
    showGlobalSettingsDialogCallback: (BuildContext context) {
      showEditGlobalStatusSensitiveSettingsDialog(context: context);
    },
  );
}
