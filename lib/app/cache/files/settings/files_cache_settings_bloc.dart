import 'package:fedi/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilesCacheSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<FilesCacheSettings> {
  static IFilesCacheSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFilesCacheSettingsBloc>(context, listen: listen);

  FilesCacheSizeLimitCountType get sizeLimitCountType;

  Stream<FilesCacheSizeLimitCountType> get sizeLimitCountTypeStream;

  Future changeSizeLimitCountType(FilesCacheSizeLimitCountType value);

  FilesCacheAgeLimitType get ageLimitType;

  Stream<FilesCacheAgeLimitType> get ageLimitTypeStream;

  Future changeAgeLimitType(FilesCacheAgeLimitType value);
}
