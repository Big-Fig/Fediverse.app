import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/settings_dialog.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalOrInstanceSettingsDialog({
  @required BuildContext context,
  @required String subTitle,
  @required Widget child,
  @required TransitionBuilder childContextBuilder,
}) {
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  var currentInstance = currentAuthInstanceBloc.currentInstance;

  showSettingsDialog(
    context: context,
    title: S.of(context).app_account_home_tab_menu_action_instance_settings(
          currentInstance.userAtHost,
        ),
    subTitle: subTitle,
    child: childContextBuilder(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const EditGlobalOrInstanceSettingsSwitcherRowWidget(),
          const FediLightGreyDivider(),
          child,
        ],
      ),
    ),
  );
}

class EditGlobalOrInstanceSettingsSwitcherRowWidget extends StatelessWidget {
  const EditGlobalOrInstanceSettingsSwitcherRowWidget();

  @override
  Widget build(BuildContext context) {
    var editGlobalOrInstanceSettingsBloc =
        IEditGlobalOrInstanceSettingsBloc.of(context);

    return FormBoolFieldFormRowWidget(
      label: S.of(context).app_settings_global_or_instance_use_global_label,
      field: editGlobalOrInstanceSettingsBloc.isUseGlobalSettingsFormBoolField,
    );
  }
}
