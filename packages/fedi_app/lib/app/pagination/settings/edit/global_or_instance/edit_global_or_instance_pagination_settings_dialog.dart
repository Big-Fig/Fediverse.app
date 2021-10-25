import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/pagination/settings/edit/edit_pagination_settings_bloc.dart';
import 'package:fedi_app/app/pagination/settings/edit/edit_pagination_settings_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/edit/edit_pagination_settings_widget.dart';
import 'package:fedi_app/app/pagination/settings/edit/global/edit_global_pagination_settings_dialog.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showEditGlobalOrInstancePaginationSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalOrInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_pagination_settings_title,
    child: const EditPaginationSettingsWidget(
      shrinkWrap: true,
    ),
    childContextBuilder: ({
      required BuildContext context,
      required Widget child,
    }) =>
        DisposableProxyProvider<GlobalOrInstanceSettingsType,
            IEditPaginationSettingsBloc>(
      update: (context, globalOrInstanceType, previous) {
        var isUseGlobalSettingsFormBoolFieldBloc =
            ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(
          context,
          listen: false,
        );

        var enabled =
            globalOrInstanceType == GlobalOrInstanceSettingsType.instance;
        var editPaginationSettingsBloc = EditPaginationSettingsBloc(
          isGlobalForced: false,
          paginationSettingsBloc: IPaginationSettingsBloc.of(
            context,
            listen: false,
          ),
          globalOrInstanceSettingsType: globalOrInstanceType,
          isEnabled: enabled,
        );

        isUseGlobalSettingsFormBoolFieldBloc.currentValueStream.listen(
          (isUseGlobalSettings) {
            editPaginationSettingsBloc.changeEnabled(!isUseGlobalSettings!);
          },
        ).disposeWith(editPaginationSettingsBloc);

        return editPaginationSettingsBloc;
      },
      child: ProxyProvider<IEditPaginationSettingsBloc,
          IEditGlobalOrInstanceSettingsBloc>(
        update: (context, value, update) => value,
        child: child,
      ),
    ),
    globalOrInstanceSettingsBloc: IPaginationSettingsBloc.of(
      context,
      listen: false,
    ),
    showGlobalSettingsDialogCallback: (BuildContext context) {
      showEditGlobalPaginationSettingsDialog(context: context);
    },
  );
}
