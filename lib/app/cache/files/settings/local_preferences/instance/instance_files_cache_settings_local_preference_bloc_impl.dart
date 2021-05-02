import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceFilesCacheSettingsLocalPreferenceBloc
    extends FilesCacheSettingsLocalPreferenceBloc<FilesCacheSettings?>
    implements IInstanceFilesCacheSettingsLocalPreferenceBloc {
  InstanceFilesCacheSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, "cache.files.settings.instance.$userAtHost");

  static const FilesCacheSettings? defaultValue = null;

  @override
  FilesCacheSettings? get defaultPreferenceValue => defaultValue;
}
