import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceFilesCacheSettingsLocalPreferencesBloc
    extends FilesCacheSettingsLocalPreferencesBloc<FilesCacheSettings?>
    implements IInstanceFilesCacheSettingsLocalPreferencesBloc {
  InstanceFilesCacheSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(preferencesService, "cache.files.settings.instance.$userAtHost");

  @override
  FilesCacheSettings? get defaultPreferenceValue => null;
}
