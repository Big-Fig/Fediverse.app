import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc_impl.dart';
import 'package:fedi/app/media/settings/edit/edit_media_settings_widget.dart';
import 'package:fedi/app/media/settings/edit/global/edit_global_media_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceMediaSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_media_settings_title,
    child: EditMediaSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      @required BuildContext context,
      @required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditMediaSettingsBloc>(
          update: (context, globalOrInstanceType, previous) {
            var isUseGlobalSettingsFormBoolFieldBloc =
            ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(context, listen: false);

            var enabled =
                globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
            var editMediaSettingsBloc = EditMediaSettingsBloc(
              mediaSettingsBloc: IMediaSettingsBloc.of(
                context,
                listen: false,
              ),
              globalOrInstanceSettingsType: globalOrInstanceType,
              enabled: enabled,
            );

            editMediaSettingsBloc.addDisposable(
              streamSubscription:
              isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
                    (isUseGlobalSettings) {
                  editMediaSettingsBloc.changeEnabled(!isUseGlobalSettings);
                },
              ),
            );
            return editMediaSettingsBloc;
          },
          child: ProxyProvider<IEditMediaSettingsBloc,
              IEditGlobalOrInstanceSettingsBloc>(
            update: (context, value, update) => value,
            child: child,
          ),
        ),
    globalOrInstanceSettingsBloc: IMediaSettingsBloc.of(
      context,
      listen: false,
    ),
    showGlobalSettingsDialogCallback: (BuildContext context) {
      showEditGlobalMediaSettingsDialog(context: context);
    },
  );
}
