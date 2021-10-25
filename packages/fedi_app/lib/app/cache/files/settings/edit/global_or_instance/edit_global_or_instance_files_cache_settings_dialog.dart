import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/cache/files/settings/edit/edit_files_cache_settings_bloc.dart';
import 'package:fedi_app/app/cache/files/settings/edit/edit_files_cache_settings_bloc_impl.dart';
import 'package:fedi_app/app/cache/files/settings/edit/edit_files_cache_settings_widget.dart';
import 'package:fedi_app/app/cache/files/settings/edit/global/edit_global_files_cache_settings_dialog.dart';
import 'package:fedi_app/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstanceFilesCacheSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_cache_files_settings_title,
    child: const EditFilesCacheSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      required BuildContext context,
      required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditFilesCacheSettingsBloc>(
      update: (context, globalOrInstanceType, previous) {
        var isUseGlobalSettingsFormBoolFieldBloc =
            ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(
          context,
          listen: false,
        );

        var enabled =
            globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
        var editCacheSettingsBloc = EditFilesCacheSettingsBloc(
          filesCacheSettingsBloc: IFilesCacheSettingsBloc.of(
            context,
            listen: false,
          ),
          globalOrInstanceSettingsType: globalOrInstanceType,
          isEnabled: enabled,
          isGlobalForced: false,
        );

        isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
          (isUseGlobalSettings) {
            editCacheSettingsBloc.changeEnabled(!isUseGlobalSettings!);
          },
        ).disposeWith(editCacheSettingsBloc);

        return editCacheSettingsBloc;
      },
      child: ProxyProvider<IEditFilesCacheSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
    globalOrInstanceSettingsBloc: IFilesCacheSettingsBloc.of(
      context,
      listen: false,
    ),
    showGlobalSettingsDialogCallback: (BuildContext context) {
      showEditGlobalFilesCacheSettingsDialog(context: context);
    },
  );
}
