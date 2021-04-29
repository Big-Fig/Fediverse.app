import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalToastSettingsLocalPreferenceBloc
    extends ToastSettingsLocalPreferenceBloc<ToastSettings>
    implements IGlobalToastSettingsLocalPreferenceBloc {
  GlobalToastSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, "toast.settings.global");

  static final ToastSettings defaultValue = ToastSettings.fromEnum(
    pushSettings: PushSettings.defaultAllEnabled(),
    handlingType: ToastHandlingType.always,
  );

  @override
  ToastSettings get defaultPreferenceValue => defaultValue;
}
