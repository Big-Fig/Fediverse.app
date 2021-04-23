import 'package:fedi/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceStatusSensitiveSettingsLocalPreferencesBloc
    extends StatusSensitiveSettingsLocalPreferencesBloc<StatusSensitiveSettings?>
    implements IInstanceStatusSensitiveSettingsLocalPreferencesBloc {
  InstanceStatusSensitiveSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          "statusSensitive.settings.instance.$userAtHost",
        );

  @override
  StatusSensitiveSettings? get defaultPreferenceValue => null;
}
