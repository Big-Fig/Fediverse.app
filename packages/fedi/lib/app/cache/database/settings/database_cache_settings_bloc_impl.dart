import 'package:fedi/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/local_preferences/global_or_instance_settings_bloc_local_preference_impl.dart';

class DatabaseCacheSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferenceBloc<DatabaseCacheSettings>
    implements IDatabaseCacheSettingsBloc {
  DatabaseCacheSettingsBloc({
    required IDatabaseCacheSettingsLocalPreferenceBloc<DatabaseCacheSettings>
        globalLocalPreferencesBloc,
    required IDatabaseCacheSettingsLocalPreferenceBloc<DatabaseCacheSettings?>
        instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  DatabaseCacheAgeLimitType get ageLimitType => settingsData.ageLimitType;

  @override
  Stream<DatabaseCacheAgeLimitType> get ageLimitTypeStream =>
      settingsDataStream.map(
        (settings) => settings.ageLimitType,
      );

  @override
  Future<void> changeAgeLimitType(DatabaseCacheAgeLimitType value) =>
      updateSettings(
        DatabaseCacheSettings.fromEnum(
          ageLimitType: value,
          entriesCountByTypeLimitType: entriesCountByTypeLimitType,
        ),
      );

  @override
  DatabaseCacheEntriesCountByTypeLimitType get entriesCountByTypeLimitType =>
      settingsData.entriesCountByTypeLimitType;

  @override
  Stream<DatabaseCacheEntriesCountByTypeLimitType>
      get entriesCountByTypeLimitTypeStream => settingsDataStream.map(
            (settings) => settings.entriesCountByTypeLimitType,
          );

  @override
  Future<void> changeEntriesCountByTypeLimit(
    DatabaseCacheEntriesCountByTypeLimitType value,
  ) =>
      updateSettings(
        DatabaseCacheSettings.fromEnum(
          ageLimitType: ageLimitType,
          entriesCountByTypeLimitType: value,
        ),
      );
}
