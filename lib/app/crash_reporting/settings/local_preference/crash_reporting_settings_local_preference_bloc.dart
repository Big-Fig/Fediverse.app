import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICrashReportingSettingsLocalPreferenceBloc
    implements ILocalPreferenceBloc<CrashReportingSettings> {
  static ICrashReportingSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICrashReportingSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
