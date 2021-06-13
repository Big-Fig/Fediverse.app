import 'package:fedi/app/crash_reporting/settings/local_preference/crash_reporting_settings_local_preference_bloc.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class CrashReportingSettingsLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<CrashReportingSettings>
    implements ICrashReportingSettingsLocalPreferenceBloc {
  CrashReportingSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => CrashReportingSettings.fromJson(json),
        );
}
