import 'package:fedi/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';

class FilesCacheSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<FilesCacheSettings>
    implements IFilesCacheSettingsBloc {
  FilesCacheSettingsBloc({
    required IFilesCacheSettingsLocalPreferencesBloc<FilesCacheSettings>
        globalLocalPreferencesBloc,
    required IFilesCacheSettingsLocalPreferencesBloc<FilesCacheSettings?>
        instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  FilesCacheSizeLimitCountType get sizeLimitCountType =>
      settingsData.sizeLimitCountType;

  @override
  Stream<FilesCacheSizeLimitCountType> get sizeLimitCountTypeStream =>
      settingsDataStream.map(
        (settings) => settings.sizeLimitCountType,
      );

  @override
  Future changeSizeLimitCountType(
    FilesCacheSizeLimitCountType value,
  ) =>
      updateSettings(
        FilesCacheSettings.fromEnum(
          sizeLimitCountType: value,
          ageLimitType: ageLimitType,
        ),
      );

  @override
  FilesCacheAgeLimitType get ageLimitType =>
      settingsData.ageLimitType;

  @override
  Stream<FilesCacheAgeLimitType> get ageLimitTypeStream =>
      settingsDataStream.map(
        (settings) => settings.ageLimitType,
      );

  @override
  Future changeAgeLimitType(FilesCacheAgeLimitType value) =>
      updateSettings(
        FilesCacheSettings.fromEnum(
          sizeLimitCountType:
              sizeLimitCountType,
          ageLimitType: value,
        ),
      );
}
