import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceToastSettingsLocalPreferencesBloc
    implements IToastSettingsLocalPreferencesBloc {
  static IInstanceToastSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceToastSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
