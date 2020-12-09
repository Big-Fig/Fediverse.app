import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalStatusSensitiveSettingsLocalPreferencesBloc
    extends StatusSensitiveSettingsLocalPreferencesBloc
    implements IGlobalStatusSensitiveSettingsLocalPreferencesBloc {
  GlobalStatusSensitiveSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "statusSensitive.settings.global");

  @override
  StatusSensitiveSettings get defaultValue => StatusSensitiveSettings(
        isAlwaysShowNsfw: false,
        isAlwaysShowSpoiler: false,
        nsfwDisplayDelayDurationMicrosecondsTotal:
            Duration(minutes: 5).inMicroseconds,
      );
}
