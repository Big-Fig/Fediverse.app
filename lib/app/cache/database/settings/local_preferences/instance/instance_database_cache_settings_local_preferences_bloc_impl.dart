import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class InstanceDatabaseCacheSettingsLocalPreferencesBloc
    extends DatabaseCacheSettingsLocalPreferencesBloc
    implements IInstanceDatabaseCacheSettingsLocalPreferencesBloc {
  InstanceDatabaseCacheSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, "cache.database.settings.instance.$userAtHost");
}
