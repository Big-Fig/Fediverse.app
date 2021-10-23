import 'package:fedi/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/local_preferences/global_or_instance_settings_bloc_local_preference_impl.dart';

class FilesCacheSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferenceBloc<FilesCacheSettings>
    implements IFilesCacheSettingsBloc {
  FilesCacheSettingsBloc({
    required IFilesCacheSettingsLocalPreferenceBloc<FilesCacheSettings>
        globalLocalPreferencesBloc,
    required IFilesCacheSettingsLocalPreferenceBloc<FilesCacheSettings?>
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
  Future<void> changeSizeLimitCountType(
    FilesCacheSizeLimitCountType value,
  ) =>
      updateSettings(
        FilesCacheSettings.fromEnum(
          sizeLimitCountType: value,
          ageLimitType: ageLimitType,
        ),
      );

  @override
  FilesCacheAgeLimitType get ageLimitType => settingsData.ageLimitType;

  @override
  Stream<FilesCacheAgeLimitType> get ageLimitTypeStream =>
      settingsDataStream.map(
        (settings) => settings.ageLimitType,
      );

  @override
  Future<void> changeAgeLimitType(FilesCacheAgeLimitType value) =>
      updateSettings(
        FilesCacheSettings.fromEnum(
          sizeLimitCountType: sizeLimitCountType,
          ageLimitType: value,
        ),
      );
}
