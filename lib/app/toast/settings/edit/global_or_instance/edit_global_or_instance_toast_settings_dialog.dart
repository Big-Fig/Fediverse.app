import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_form_bool_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc_impl.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_widget.dart';
import 'package:fedi/app/toast/settings/edit/global/edit_global_toast_settings_dialog.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
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
    child: EditToastSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      @required BuildContext context,
      @required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditToastSettingsBloc>(
      update: (context, globalOrInstanceType, previous) {
        var isUseGlobalSettingsFormBoolFieldBloc =
            IIsUseGlobalSettingsFormBoolFieldBloc.of(context, listen: false);

        var enabled =
            globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
        var editToastSettingsBloc = EditToastSettingsBloc(
          toastSettingsBloc: IToastSettingsBloc.of(
            context,
            listen: false,
          ),
          globalOrInstanceSettingsType: globalOrInstanceType,
          enabled: enabled,
        );

        editToastSettingsBloc.addDisposable(
          streamSubscription:
              isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
            (isUseGlobalSettings) {
              editToastSettingsBloc.changeEnabled(!isUseGlobalSettings);
            },
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
