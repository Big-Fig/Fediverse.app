import 'package:fedi_app/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

abstract class StatusSensitiveSettingsLocalPreferenceBloc<
        T extends StatusSensitiveSettings?> extends ObjectLocalPreferenceBloc<T>
    implements IStatusSensitiveSettingsLocalPreferenceBloc<T> {
  StatusSensitiveSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => StatusSensitiveSettings.fromJson(json) as T,
        );
}
