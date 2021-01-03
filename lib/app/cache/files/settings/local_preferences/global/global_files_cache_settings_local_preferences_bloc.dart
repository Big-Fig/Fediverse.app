import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalFilesCacheSettingsLocalPreferencesBloc
    implements IFilesCacheSettingsLocalPreferencesBloc {
  static IGlobalFilesCacheSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IGlobalFilesCacheSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
