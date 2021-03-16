import 'package:fedi/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalStatusSensitiveSettingsLocalPreferencesBloc
    implements IStatusSensitiveSettingsLocalPreferencesBloc {
  static IGlobalStatusSensitiveSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalStatusSensitiveSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
