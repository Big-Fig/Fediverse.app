import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class FilesCacheSettingsLocalPreferencesBloc<T extends FilesCacheSettings?>
    extends ObjectLocalPreferenceBloc<T>
    implements IFilesCacheSettingsLocalPreferencesBloc<T> {
  FilesCacheSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => FilesCacheSettings.fromJson(json) as T,
        );

}
