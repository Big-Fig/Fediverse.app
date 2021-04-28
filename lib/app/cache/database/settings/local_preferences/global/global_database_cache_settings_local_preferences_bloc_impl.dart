import 'package:fedi/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalDatabaseCacheSettingsLocalPreferencesBloc
    extends DatabaseCacheSettingsLocalPreferencesBloc<DatabaseCacheSettings>
    implements IGlobalDatabaseCacheSettingsLocalPreferencesBloc {
  static final defaultValue = DatabaseCacheSettings.fromEnum(
    entriesCountByTypeLimitType:
        DatabaseCacheEntriesCountByTypeLimitType.notSet,
    ageLimitType: DatabaseCacheAgeLimitType.notSet,
  );

  GlobalDatabaseCacheSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService,
          "cache.database.settings.global",
        );

  @override
  DatabaseCacheSettings get defaultPreferenceValue => defaultValue;
}
