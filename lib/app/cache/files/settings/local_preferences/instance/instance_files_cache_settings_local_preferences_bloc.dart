import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceFilesCacheSettingsLocalPreferencesBloc
    implements IFilesCacheSettingsLocalPreferencesBloc {
  static IInstanceFilesCacheSettingsLocalPreferencesBloc of(
          BuildContext context,
          {bool listen = true}) =>
      Provider.of<IInstanceFilesCacheSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
