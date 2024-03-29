import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc_impl.dart';
import 'package:fedi_app/app/status/sensitive/settings/edit/edit_status_sensitive_settings_widget.dart';
import 'package:fedi_app/app/status/sensitive/settings/edit/global/edit_global_status_sensitive_settings_dialog.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceStatusSensitiveSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_status_sensitive_settings_title,
    child: const EditStatusSensitiveSettingsWidget(
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
            ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(
          context,
          listen: false,
        );

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

        isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
          (isUseGlobalSettings) {
            editStatusSensitiveSettingsBloc
                .changeEnabled(!isUseGlobalSettings!);
          },
        ).disposeWith(editStatusSensitiveSettingsBloc);

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
