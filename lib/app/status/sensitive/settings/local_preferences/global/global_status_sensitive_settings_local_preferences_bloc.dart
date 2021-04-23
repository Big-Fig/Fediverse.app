import 'package:fedi/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalStatusSensitiveSettingsLocalPreferencesBloc
    implements IStatusSensitiveSettingsLocalPreferencesBloc<StatusSensitiveSettings> {
  static IGlobalStatusSensitiveSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalStatusSensitiveSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
