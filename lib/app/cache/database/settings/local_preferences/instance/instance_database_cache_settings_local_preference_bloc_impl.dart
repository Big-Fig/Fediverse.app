import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceDatabaseCacheSettingsLocalPreferenceBloc
    extends DatabaseCacheSettingsLocalPreferenceBloc<DatabaseCacheSettings?>
    implements IInstanceDatabaseCacheSettingsLocalPreferenceBloc {
  InstanceDatabaseCacheSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          "cache.database.settings.instance.$userAtHost",
        );

  static const DatabaseCacheSettings? defaultValue = null;

  @override
  DatabaseCacheSettings? get defaultPreferenceValue => defaultValue;
}
