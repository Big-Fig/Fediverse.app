import 'package:fedi_app/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/toast/settings/local_preferences/toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/toast/settings/toast_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class InstanceToastSettingsLocalPreferenceBloc
    extends ToastSettingsLocalPreferenceBloc<ToastSettings?>
    implements IInstanceToastSettingsLocalPreferenceBloc {
  InstanceToastSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, 'toast.settings.instance.$userAtHost');

  static const ToastSettings? defaultValue = null;

  @override
  ToastSettings? get defaultPreferenceValue => defaultValue;
}
