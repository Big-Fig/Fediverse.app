import 'package:fedi/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'files_cache_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 97)
class FilesCacheSettings implements IJsonObject, ISettings<FilesCacheSettings> {
  @HiveField(2)
  @JsonKey(name: "files_cache_size_limit_count_type_string")
  final String sizeLimitCountTypeString;

  @HiveField(3)
  @JsonKey(name: "files_cache_ageL_limit_type_string")
  final String ageLimitTypeString;

  FilesCacheSizeLimitCountType get sizeLimitCountType =>
      sizeLimitCountTypeString.toFilesCacheSizeLimitCountType();

  FilesCacheAgeLimitType get ageLimitType =>
      ageLimitTypeString.toFilesCacheAgeLimitType();

  FilesCacheSettings({
    required this.sizeLimitCountTypeString,
    required this.ageLimitTypeString,
  });

  FilesCacheSettings.fromEnum({
    required FilesCacheSizeLimitCountType sizeLimitCountType,
    required FilesCacheAgeLimitType ageLimitType,
  }) : this(
          sizeLimitCountTypeString:
          sizeLimitCountType.toJsonValue(),
          ageLimitTypeString: ageLimitType.toJsonValue(),
        );

  static FilesCacheSettings fromJson(Map<String, dynamic> json) =>
      _$FilesCacheSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FilesCacheSettingsToJson(this);

  @override
  FilesCacheSettings clone() => copyWith();

  FilesCacheSettings copyWith({
    FilesCacheSizeLimitCountType? sizeLimitCountType,
    FilesCacheAgeLimitType? ageLimitType,
  }) =>
      FilesCacheSettings.fromEnum(
        sizeLimitCountType:
            sizeLimitCountType ?? this.sizeLimitCountType,
        ageLimitType:
            ageLimitType ?? this.ageLimitType,
      );

  @override
  String toString() => 'FilesCacheSettings{'
      'sizeLimitCountTypeString: '
      '$sizeLimitCountTypeString, '
      'ageLimitTypeString: $ageLimitTypeString'
      '}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilesCacheSettings &&
          runtimeType == other.runtimeType &&
          sizeLimitCountTypeString ==
              other.sizeLimitCountTypeString &&
          ageLimitTypeString == other.ageLimitTypeString;

  @override
  int get hashCode =>
      sizeLimitCountTypeString.hashCode ^
      ageLimitTypeString.hashCode;
}
