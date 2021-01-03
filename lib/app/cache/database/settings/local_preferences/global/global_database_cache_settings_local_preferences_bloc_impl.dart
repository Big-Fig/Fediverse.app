import 'package:fedi/app/cache/database/database_cache_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalDatabaseCacheSettingsLocalPreferencesBloc
    extends DatabaseCacheSettingsLocalPreferencesBloc
    implements IGlobalDatabaseCacheSettingsLocalPreferencesBloc {
  GlobalDatabaseCacheSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "cache.database.settings.global");

  @override
  DatabaseCacheSettings get defaultValue => DatabaseCacheSettings(
        entriesCountByTypeLimitTypeString:
            DatabaseCacheEntriesCountByTypeLimitType.notSet?.toJsonValue(),
        ageLimitTypeString: DatabaseCacheAgeLimitType.notSet?.toJsonValue(),
      );
}
