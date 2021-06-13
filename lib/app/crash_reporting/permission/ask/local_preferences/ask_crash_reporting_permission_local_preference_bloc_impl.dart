import 'package:fedi/app/crash_reporting/permission/ask/local_preferences/ask_crash_reporting_permission_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class AskCrashReportingPermissionLocalPreferenceBloc
    extends BoolLocalPreferenceBloc
    implements IAskCrashReportingPermissionLocalPreferenceBloc {
  AskCrashReportingPermissionLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'crash_reporting.permission_asked',
        );

  static const defaultValue = false;

  @override
  bool get defaultPreferenceValue => defaultValue;
}
