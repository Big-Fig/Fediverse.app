import 'package:fedi_app/app/crash_reporting/settings/local_preference/crash_reporting_settings_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalCrashReportingSettingsLocalPreferenceBloc
    implements ICrashReportingSettingsLocalPreferenceBloc {
  static IGlobalCrashReportingSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalCrashReportingSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
