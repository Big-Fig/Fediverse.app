import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusSensitiveSettingsLocalPreferenceBloc<
    T extends StatusSensitiveSettings?> implements ILocalPreferenceBloc<T> {
  static IStatusSensitiveSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusSensitiveSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
