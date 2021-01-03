import 'package:fedi/app/cache/database/database_cache_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:flutter/widgets.dart';

class DatabaseCacheSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<DatabaseCacheSettings>
    implements IDatabaseCacheSettingsBloc {
  DatabaseCacheSettingsBloc({
    @required
        IDatabaseCacheSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    @required
        IDatabaseCacheSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  DatabaseCacheAgeLimitType get ageLimit => settingsData.ageLimitType;

  @override
  Stream<DatabaseCacheAgeLimitType> get ageLimitStream =>
      settingsDataStream.map(
        (settings) => settings.ageLimitType,
      );

  @override
  Future changeAgeLimit(DatabaseCacheAgeLimitType value) => updateSettings(
        DatabaseCacheSettings(
          ageLimitTypeString: value?.toJsonValue(),
          entriesCountByTypeLimitTypeString:
              entriesCountByTypeLimit?.toJsonValue(),
        ),
      );

  @override
  DatabaseCacheEntriesCountByTypeLimitType get entriesCountByTypeLimit =>
      settingsData.entriesCountByTypeLimitType;

  @override
  Stream<DatabaseCacheEntriesCountByTypeLimitType>
      get entriesCountByTypeLimitStream => settingsDataStream.map(
            (settings) => settings.entriesCountByTypeLimitType,
          );

  @override
  Future changeEntriesCountByTypeLimit(
          DatabaseCacheEntriesCountByTypeLimitType value) =>
      updateSettings(
        DatabaseCacheSettings(
          ageLimitTypeString: ageLimit?.toJsonValue(),
          entriesCountByTypeLimitTypeString: value?.toJsonValue(),
        ),
      );
}
