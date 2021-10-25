import 'package:fedi_app/app/status/sensitive/settings/local_preferences/status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalStatusSensitiveSettingsLocalPreferenceBloc
    implements
        IStatusSensitiveSettingsLocalPreferenceBloc<StatusSensitiveSettings> {
  static IGlobalStatusSensitiveSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalStatusSensitiveSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
