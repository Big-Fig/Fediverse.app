import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_row.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/app/settings/settings_dialog.dart';
import 'package:fedi_app/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger('edit_global_or_instance_settings_dialog.dart');

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
  var currentUnifediApiAccessBloc =
      ICurrentAccessBloc.of(context, listen: false);
  var currentInstance = currentUnifediApiAccessBloc.currentInstance!;

  showSettingsDialog(
    context: context,
    title: S.of(context).app_settings_instance_title(
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
              var globalOrInstanceSettingsType =
                  snapshot.data ?? GlobalOrInstanceSettingsType.global;
              _logger.finest(
                () =>
                    'globalOrInstanceSettingsType $globalOrInstanceSettingsType',
              );

              return Provider<GlobalOrInstanceSettingsType>.value(
                value: globalOrInstanceSettingsType,
                child: _EditGlobalOrInstanceSettingsDialogBodyWidget(
                  showGlobalSettingsDialogCallback:
                      showGlobalSettingsDialogCallback,
                  child: childContextBuilder(
                    context: context,
                    child: child,
                  ),
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
  Widget build(BuildContext context) => Column(
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
