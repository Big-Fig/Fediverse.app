import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalToastSettingsLocalPreferencesBloc
    implements IToastSettingsLocalPreferencesBloc<ToastSettings> {
  static IGlobalToastSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalToastSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
