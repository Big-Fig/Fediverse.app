import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_widget.dart';
import 'package:fedi/app/toast/settings/edit/global/edit_global_toast_settings_dialog.dart';
import 'package:fedi/app/toast/settings/edit/global_or_instance/edit_global_or_instance_toast_settings_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger('edit_global_or_instance_toast_settings_dialog.dart');

void showEditGlobalOrInstanceToastSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_toast_settings_title,
    child: EditToastSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      required BuildContext context,
      required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditToastSettingsBloc>(
      update: (context, globalOrInstanceType, previous) {
        _logger.finest(() => 'globalOrInstanceType $globalOrInstanceType');

        var isEnabled =
            globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
        var editToastSettingsBloc = EditGlobalOrInstanceToastSettingsBloc(
          isGlobalForced: false,
          toastSettingsBloc: IToastSettingsBloc.of(
            context,
            listen: false,
          ),
          globalOrInstanceSettingsType: globalOrInstanceType,
          isEnabled: isEnabled,
          currentInstance:
              ICurrentUnifediApiAccessBloc.of(context, listen: false)
                  .currentInstance,
          switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc:
              ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(
            context,
            listen: false,
          ),
        );

        return editToastSettingsBloc;
      },
      child: ProxyProvider<IEditToastSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
    globalOrInstanceSettingsBloc: IToastSettingsBloc.of(
      context,
      listen: false,
    ),
    showGlobalSettingsDialogCallback: (BuildContext context) {
      showEditGlobalToastSettingsDialog(context: context);
    },
  );
}
