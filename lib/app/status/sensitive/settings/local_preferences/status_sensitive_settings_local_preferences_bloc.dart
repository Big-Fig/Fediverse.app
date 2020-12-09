import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';


abstract class IStatusSensitiveSettingsLocalPreferencesBloc
    implements ILocalPreferenceBloc<StatusSensitiveSettings> {
  static IStatusSensitiveSettingsLocalPreferencesBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<IStatusSensitiveSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
