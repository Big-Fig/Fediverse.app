import 'package:fedi_app/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class GlobalStatusSensitiveSettingsLocalPreferenceBloc
    extends StatusSensitiveSettingsLocalPreferenceBloc<StatusSensitiveSettings>
    implements IGlobalStatusSensitiveSettingsLocalPreferenceBloc {
  GlobalStatusSensitiveSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, 'statusSensitive.settings.global');

  static final StatusSensitiveSettings defaultValue = StatusSensitiveSettings(
    isAlwaysShowNsfw: false,
    isAlwaysShowSpoiler: false,
    isNeedReplaceBlurWithFill: false,
    nsfwDisplayDelayDurationMicrosecondsTotal:
        // ignore: no-magic-number
        const Duration(minutes: 5).inMicroseconds,
  );

  @override
  StatusSensitiveSettings get defaultPreferenceValue => defaultValue;
}
