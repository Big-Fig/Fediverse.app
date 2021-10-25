import 'package:fedi_app/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class InstanceStatusSensitiveSettingsLocalPreferenceBloc
    extends StatusSensitiveSettingsLocalPreferenceBloc<StatusSensitiveSettings?>
    implements IInstanceStatusSensitiveSettingsLocalPreferenceBloc {
  InstanceStatusSensitiveSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          'statusSensitive.settings.instance.$userAtHost',
        );

  static const StatusSensitiveSettings? defaultValue = null;

  @override
  StatusSensitiveSettings? get defaultPreferenceValue => defaultValue;
}
