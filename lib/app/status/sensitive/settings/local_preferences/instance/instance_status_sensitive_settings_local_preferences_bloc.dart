import 'package:fedi/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceStatusSensitiveSettingsLocalPreferencesBloc
    implements IStatusSensitiveSettingsLocalPreferencesBloc {
  static IInstanceStatusSensitiveSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceStatusSensitiveSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
