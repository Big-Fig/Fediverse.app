import 'package:fedi_app/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/app/toast/settings/edit/edit_toast_settings_bloc_impl.dart';
import 'package:fedi_app/app/toast/settings/toast_settings_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EditGlobalOrInstanceToastSettingsBloc extends EditToastSettingsBloc {
  ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc
      switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc;

  EditGlobalOrInstanceToastSettingsBloc({
    required IToastSettingsBloc toastSettingsBloc,
    required UnifediApiAccess? currentInstance,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
    required IUnifediApiPushSubscriptionService
        unifediApiPushSubscriptionService,
    required this.switchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc,
  }) : super(
          unifediApiPushSubscriptionService: unifediApiPushSubscriptionService,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          toastSettingsBloc: toastSettingsBloc,
          currentInstance: currentInstance,
          isEnabled: isEnabled,
          isGlobalForced: isGlobalForced,
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
