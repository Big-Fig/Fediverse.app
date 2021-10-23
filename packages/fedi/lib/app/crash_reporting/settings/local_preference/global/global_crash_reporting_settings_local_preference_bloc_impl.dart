import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/app/crash_reporting/settings/local_preference/crash_reporting_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/crash_reporting/settings/local_preference/global/global_crash_reporting_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalCrashReportingSettingsLocalPreferenceBloc
    extends CrashReportingSettingsLocalPreferenceBloc
    implements IGlobalCrashReportingSettingsLocalPreferenceBloc {
  final CrashReportingSettings defaultValue;

  GlobalCrashReportingSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required this.defaultValue,
  }) : super(preferencesService, 'crash_reporting.settings.global');

  @override
  CrashReportingSettings get defaultPreferenceValue => defaultValue;
}
