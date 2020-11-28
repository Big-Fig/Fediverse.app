import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:flutter/widgets.dart';

class EditGlobalOrInstanceToastSettingsBloc extends EditToastSettingsBloc {
  ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc
      switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc;

  EditGlobalOrInstanceToastSettingsBloc({
    @required IToastSettingsBloc toastSettingsBloc,
    @required AuthInstance currentInstance,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool isEnabled,
    @required this.switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc,
  }) : super(
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          toastSettingsBloc: toastSettingsBloc,
          currentInstance: currentInstance,
          isEnabled: isEnabled,
        );

  @override
  bool get isPossibleToSaveSettingsToBloc {
    if (switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc
            .globalOrInstanceSettingsType ==
        null) {
      return true;
    }
    return super.isPossibleToSaveSettingsToBloc;
  }
}
