import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAskCrashReportingPermissionLocalPreferenceBloc
    implements ILocalPreferenceBloc<bool> {
  static IAskCrashReportingPermissionLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAskCrashReportingPermissionLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
