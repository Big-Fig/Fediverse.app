import 'package:fedi/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalDatabaseCacheSettingsLocalPreferenceBloc
    extends DatabaseCacheSettingsLocalPreferenceBloc<DatabaseCacheSettings>
    implements IGlobalDatabaseCacheSettingsLocalPreferenceBloc {
  static final defaultValue = DatabaseCacheSettings.fromEnum(
    entriesCountByTypeLimitType:
        DatabaseCacheEntriesCountByTypeLimitType.notSet,
    ageLimitType: DatabaseCacheAgeLimitType.notSet,
  );

  GlobalDatabaseCacheSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService,
          'cache.database.settings.global',
        );

  @override
  DatabaseCacheSettings get defaultPreferenceValue => defaultValue;
}
