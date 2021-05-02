import 'package:fedi/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalFilesCacheSettingsLocalPreferenceBloc
    extends FilesCacheSettingsLocalPreferenceBloc<FilesCacheSettings>
    implements IGlobalFilesCacheSettingsLocalPreferencesBloc {
  GlobalFilesCacheSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, "cache.files.settings.global");

  static final FilesCacheSettings defaultValue = FilesCacheSettings.fromEnum(
    sizeLimitCountType:
        FilesCacheSizeLimitCountType.size50,
    ageLimitType: FilesCacheAgeLimitType.days7,
  );

  @override
  FilesCacheSettings get defaultPreferenceValue => defaultValue;
}
