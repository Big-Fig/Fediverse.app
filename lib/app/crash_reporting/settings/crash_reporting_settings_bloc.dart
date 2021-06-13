import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/app/settings/global/global_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICrashReportingSettingsBloc
    implements IGlobalSettingsBloc<CrashReportingSettings> {
  static ICrashReportingSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICrashReportingSettingsBloc>(
        context,
        listen: listen,
      );

  bool get reportingEnabled;

  Stream<bool> get reportingEnabledStream;

  Future changeReportingEnabled(bool value);
}
