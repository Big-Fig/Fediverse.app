import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalDatabaseCacheSettingsLocalPreferenceBloc
    implements
        IDatabaseCacheSettingsLocalPreferenceBloc<DatabaseCacheSettings> {
  static IGlobalDatabaseCacheSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalDatabaseCacheSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
