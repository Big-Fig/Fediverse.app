import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceToastSettingsLocalPreferencesBloc
    extends ToastSettingsLocalPreferencesBloc<ToastSettings?>
    implements IInstanceToastSettingsLocalPreferencesBloc {
  InstanceToastSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, "toast.settings.instance.$userAtHost");

  @override
  ToastSettings? get defaultPreferenceValue => null;
}
