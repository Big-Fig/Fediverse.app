import 'package:fedi_app/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/files_cache_settings_local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

abstract class FilesCacheSettingsLocalPreferenceBloc<
        T extends FilesCacheSettings?> extends ObjectLocalPreferenceBloc<T>
    implements IFilesCacheSettingsLocalPreferenceBloc<T> {
  FilesCacheSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => FilesCacheSettings.fromJson(json) as T,
        );
}
