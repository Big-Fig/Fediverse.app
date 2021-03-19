import 'package:fedi/app/cache/files/cache/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/cache/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';

class FilesCacheSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<FilesCacheSettings?>
    implements IFilesCacheSettingsBloc {
  FilesCacheSettingsBloc({
    required IFilesCacheSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    required IFilesCacheSettingsLocalPreferencesBloc
        instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  FilesCacheSizeLimitCountType? get filesCacheSizeLimitCountType =>
      settingsData?.filesCacheSizeLimitCountType;

  @override
  Stream<FilesCacheSizeLimitCountType?>
      get filesCacheSizeLimitCountTypeStream => settingsDataStream.map(
            (settings) => settings?.filesCacheSizeLimitCountType,
          );

  @override
  Future changeFilesCacheSizeLimitCountType(
    FilesCacheSizeLimitCountType value,
  ) =>
      updateSettings(
        FilesCacheSettings(
          filesCacheSizeLimitCountTypeString: value.toJsonValue(),
          filesCacheAgeLimitTypeString: filesCacheAgeLimitType?.toJsonValue(),
        ),
      );

  @override
  FilesCacheAgeLimitType? get filesCacheAgeLimitType =>
      settingsData?.filesCacheAgeLimitType;

  @override
  Stream<FilesCacheAgeLimitType?> get filesCacheAgeLimitTypeStream =>
      settingsDataStream.map(
        (settings) => settings?.filesCacheAgeLimitType,
      );

  @override
  Future changeFilesCacheAgeLimitType(FilesCacheAgeLimitType value) =>
      updateSettings(
        FilesCacheSettings(
          filesCacheSizeLimitCountTypeString:
              filesCacheSizeLimitCountType?.toJsonValue(),
          filesCacheAgeLimitTypeString: value.toJsonValue(),
        ),
      );
}
