import 'package:fedi/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class StatusSensitiveSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<StatusSensitiveSettings>
    implements IStatusSensitiveSettingsLocalPreferencesBloc {
  StatusSensitiveSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => StatusSensitiveSettings.fromJson(json),
        );
}
