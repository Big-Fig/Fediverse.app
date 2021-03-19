import 'package:fedi/app/media/settings/local_preferences/media_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalMediaSettingsLocalPreferencesBloc
    implements IMediaSettingsLocalPreferencesBloc {
  static IGlobalMediaSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalMediaSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
