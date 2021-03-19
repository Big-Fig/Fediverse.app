import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_row.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/settings/settings_dialog.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger("edit_global_or_instance_settings_dialog.dart");

typedef EditGlobalOrInstanceSettingsDialogContextContextBuilder = Widget
    Function({
  required BuildContext context,
  required Widget child,
});

void showEditGlobalOrInstanceSettingsDialog({
  required BuildContext context,
  required String subTitle,
  required Widget child,
  required EditGlobalOrInstanceSettingsDialogContextContextBuilder
      childContextBuilder,
  required IGlobalOrInstanceSettingsBloc globalOrInstanceSettingsBloc,
  required ShowGlobalSettingsDialogCallback showGlobalSettingsDialogCallback,
}) {
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  var currentInstance = currentAuthInstanceBloc.currentInstance!;

  showSettingsDialog(
    context: context,
    title: S.of(context).app_account_home_tab_menu_action_instance_settings(
          currentInstance.userAtHost,
        ),
    subTitle: subTitle,
    child: DisposableProvider<
        ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc>(
      create: (context) =>
          SwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc(
        globalOrInstanceSettingsBloc: globalOrInstanceSettingsBloc,
      ),
      child: Builder(
        builder: (context) {
          var isUseGlobalSettingsFormBoolFieldBloc =
              ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(
            context,
          );
          return StreamBuilder<GlobalOrInstanceSettingsType?>(
            stream: isUseGlobalSettingsFormBoolFieldBloc
                .globalOrInstanceSettingsTypeStream,
            initialData: isUseGlobalSettingsFormBoolFieldBloc
                .globalOrInstanceSettingsType,
            builder: (context, snapshot) {
              var globalOrInstanceSettingsType = snapshot.data;
              _logger.finest(() =>
                  "globalOrInstanceSettingsType $globalOrInstanceSettingsType");

              return Provider<GlobalOrInstanceSettingsType?>.value(
                value: globalOrInstanceSettingsType,
                child: _EditGlobalOrInstanceSettingsDialogBodyWidget(
                  child: childContextBuilder(
                    context: context,
                    child: child,
                  ),
                  showGlobalSettingsDialogCallback:
                      showGlobalSettingsDialogCallback,
                ),
              );
            },
          );
        },
      ),
    ),
  );
}

class _EditGlobalOrInstanceSettingsDialogBodyWidget extends StatelessWidget {
  final Widget child;
  final ShowGlobalSettingsDialogCallback showGlobalSettingsDialogCallback;

  const _EditGlobalOrInstanceSettingsDialogBodyWidget({
    Key? key,
    required this.child,
    required this.showGlobalSettingsDialogCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldRowWidget(
          showGlobalSettingsDialogCallback: showGlobalSettingsDialogCallback,
        ),
        const FediLightGreyDivider(),
        child,
      ],
    );
  }
}
