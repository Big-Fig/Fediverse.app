import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalDatabaseCacheSettingsLocalPreferencesBloc
    implements IDatabaseCacheSettingsLocalPreferencesBloc {
  static IGlobalDatabaseCacheSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IGlobalDatabaseCacheSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
