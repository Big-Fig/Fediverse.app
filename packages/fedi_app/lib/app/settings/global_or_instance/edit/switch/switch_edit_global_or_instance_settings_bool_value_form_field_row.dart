import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi_app/app/ui/form/fedi_form_row.dart';
import 'package:fedi_app/app/ui/switch/fedi_switch.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ShowGlobalSettingsDialogCallback = void Function(BuildContext context);

class ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldRowWidget
    extends StatelessWidget {
  final ShowGlobalSettingsDialogCallback showGlobalSettingsDialogCallback;

  const ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldRowWidget({
    Key? key,
    required this.showGlobalSettingsDialogCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc =
        ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.of(context);

    return StreamBuilder<bool?>(
      stream: switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc
          .currentValueStream
          .distinct(),
      initialData:
          switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data == true;

        // _logger.finest(() => 'currentValue $currentValue');
        var overrideGlobal = !currentValue;

        return FediFormRow(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  showGlobalSettingsDialogCallback(context);
                },
                child: Text(
                  S
                      .of(context)
                      .app_settings_global_or_instance_override_global_label,
                  style: IFediUiTextTheme.of(context).bigTallPrimary,
                ),
              ),
              FediSwitch(
                onChanged: (newValue) =>
                    switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc
                        .changeCurrentValue(
                  !newValue,
                ),
                value: overrideGlobal,
                enabled: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
