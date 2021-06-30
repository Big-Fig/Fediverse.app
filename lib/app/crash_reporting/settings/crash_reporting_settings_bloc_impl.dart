import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_bloc.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/app/crash_reporting/settings/local_preference/crash_reporting_settings_local_preference_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';

class CrashReportingSettingsBloc extends DisposableOwner
    implements ICrashReportingSettingsBloc {
  final ICrashReportingSettingsLocalPreferenceBloc
      crashReportingSettingsLocalPreferencesBloc;

  CrashReportingSettingsBloc({
    required this.crashReportingSettingsLocalPreferencesBloc,
  });

  @override
  CrashReportingSettings get settingsData =>
      crashReportingSettingsLocalPreferencesBloc.value;

  @override
  Stream<CrashReportingSettings> get settingsDataStream =>
      crashReportingSettingsLocalPreferencesBloc.stream;

  @override
  bool get reportingEnabled => settingsData.reportingEnabled;

  @override
  Stream<bool> get reportingEnabledStream =>
      settingsDataStream.map((settings) => settings.reportingEnabled);

  @override
  Future changeReportingEnabled(bool value) => updateSettings(
        // copyWith dont set null values
        CrashReportingSettings(
          reportingEnabled: value,
        ),
      );

  @override
  Future updateSettings(CrashReportingSettings newSettings) async {
    await crashReportingSettingsLocalPreferencesBloc.setValue(
      newSettings,
    );
  }
}
