import 'package:fedi/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'files_cache_settings_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'files_cache_settings_model.g.dart';

@freezed
@HiveType(typeId: -32 + 97)
class FilesCacheSettings
    with _$FilesCacheSettings
    implements IJsonObj, ISettings<FilesCacheSettings> {
  const FilesCacheSettings._();

  const factory FilesCacheSettings({
    @HiveField(2)
    @JsonKey(name: 'files_cache_size_limit_count_type_string')
        required String sizeLimitCountTypeString,
    @HiveField(3)
    @JsonKey(name: 'files_cache_ageL_limit_type_string')
        required String ageLimitTypeString,
  }) = _FilesCacheSettings;

  FilesCacheSizeLimitCountType get sizeLimitCountType =>
      sizeLimitCountTypeString.toFilesCacheSizeLimitCountType();

  FilesCacheAgeLimitType get ageLimitType =>
      ageLimitTypeString.toFilesCacheAgeLimitType();

  static FilesCacheSettings fromEnum({
    required FilesCacheSizeLimitCountType sizeLimitCountType,
    required FilesCacheAgeLimitType ageLimitType,
  }) =>
      FilesCacheSettings(
        sizeLimitCountTypeString: sizeLimitCountType.toJsonValue(),
        ageLimitTypeString: ageLimitType.toJsonValue(),
      );

  factory FilesCacheSettings.fromJson(Map<String, dynamic> json) =>
      _$FilesCacheSettingsFromJson(json);

  @override
  FilesCacheSettings clone() => copyWith();
}
