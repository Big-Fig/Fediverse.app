import 'package:fedi/app/media/settings/local_preferences/media_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceMediaSettingsLocalPreferencesBloc
    implements IMediaSettingsLocalPreferencesBloc {
  static IInstanceMediaSettingsLocalPreferencesBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<IInstanceMediaSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
