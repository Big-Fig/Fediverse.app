import 'package:fedi/app/cache/files/cache/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/cache/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalFilesCacheSettingsLocalPreferencesBloc
    extends FilesCacheSettingsLocalPreferencesBloc
    implements IGlobalFilesCacheSettingsLocalPreferencesBloc {
  GlobalFilesCacheSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "cache.files.settings.global");

  @override
  FilesCacheSettings get defaultValue => FilesCacheSettings(
        filesCacheSizeLimitCountTypeString:
            FilesCacheSizeLimitCountType.size50.toJsonValue(),
        filesCacheAgeLimitTypeString:
            FilesCacheAgeLimitType.days7.toJsonValue(),
      );
}
