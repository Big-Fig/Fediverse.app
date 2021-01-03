import 'package:fedi/app/cache/files/files_cache_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/files_cache_settings_local_preferences_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:flutter/widgets.dart';

class FilesCacheSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<FilesCacheSettings>
    implements IFilesCacheSettingsBloc {
  FilesCacheSettingsBloc({
    @required
        IFilesCacheSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    @required
        IFilesCacheSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  FilesCacheSizeLimitCountType get filesCacheSizeLimitCountType =>
      settingsData.filesCacheSizeLimitCountType;

  @override
  Stream<FilesCacheSizeLimitCountType> get filesCacheSizeLimitCountTypeStream =>
      settingsDataStream.map(
        (settings) => settings.filesCacheSizeLimitCountType,
      );

  @override
  Future changeFilesCacheSizeLimitCountType(
          FilesCacheSizeLimitCountType value) =>
      updateSettings(
        FilesCacheSettings(
          filesCacheSizeLimitCountTypeString: value?.toJsonValue(),
          filesCacheAgeLimitTypeString: filesCacheAgeLimitType?.toJsonValue(),
        ),
      );

  @override
  FilesCacheAgeLimitType get filesCacheAgeLimitType =>
      settingsData.filesCacheAgeLimitType;

  @override
  Stream<FilesCacheAgeLimitType> get filesCacheAgeLimitTypeStream =>
      settingsDataStream.map(
        (settings) => settings.filesCacheAgeLimitType,
      );

  @override
  Future changeFilesCacheAgeLimitType(FilesCacheAgeLimitType value) =>
      updateSettings(
        FilesCacheSettings(
          filesCacheSizeLimitCountTypeString: filesCacheSizeLimitCountType?.toJsonValue(),
          filesCacheAgeLimitTypeString: value?.toJsonValue(),
        ),
      );
}
