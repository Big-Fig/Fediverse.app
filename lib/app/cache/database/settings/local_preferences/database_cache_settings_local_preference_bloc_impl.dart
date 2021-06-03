import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/database_cache_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class DatabaseCacheSettingsLocalPreferenceBloc<
        T extends DatabaseCacheSettings?> extends ObjectLocalPreferenceBloc<T>
    implements IDatabaseCacheSettingsLocalPreferenceBloc<T> {
  DatabaseCacheSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => DatabaseCacheSettings.fromJson(json) as T,
        );
}
