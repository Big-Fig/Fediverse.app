import 'dart:convert';

import 'package:fedi/app/cache/files/cache/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/cache/limit/size_count/files_cache_size_count_limit_model.dart';
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
  final String filesCacheSizeLimitCountTypeString;

  @HiveField(3)
  @JsonKey(name: "files_cache_ageL_limit_type_string")
  final String filesCacheAgeLimitTypeString;

  FilesCacheSizeLimitCountType get filesCacheSizeLimitCountType =>
      filesCacheSizeLimitCountTypeString.toFilesCacheSizeLimitCountType();

  FilesCacheAgeLimitType get filesCacheAgeLimitType =>
      filesCacheAgeLimitTypeString.toFilesCacheAgeLimitType();

  FilesCacheSettings({
    required this.filesCacheSizeLimitCountTypeString,
    required this.filesCacheAgeLimitTypeString,
  });

  factory FilesCacheSettings.fromJson(Map<String, dynamic> json) =>
      _$FilesCacheSettingsFromJson(json);

  factory FilesCacheSettings.fromJsonString(String jsonString) =>
      _$FilesCacheSettingsFromJson(jsonDecode(jsonString));

  static List<FilesCacheSettings> listFromJsonString(String str) =>
      List<FilesCacheSettings>.from(
        json.decode(str).map((x) => FilesCacheSettings.fromJson(x)),
      );

  @override
  Map<String, dynamic> toJson() => _$FilesCacheSettingsToJson(this);

  String toJsonString() => jsonEncode(_$FilesCacheSettingsToJson(this));

  @override
  FilesCacheSettings clone() => copyWith();

  FilesCacheSettings copyWith({
    String? filesCacheSizeLimitCountTypeString,
    String? filesCacheAgeLimitTypeString,
  }) =>
      FilesCacheSettings(
        filesCacheSizeLimitCountTypeString:
            filesCacheSizeLimitCountTypeString ??
                this.filesCacheSizeLimitCountTypeString,
        filesCacheAgeLimitTypeString:
            filesCacheAgeLimitTypeString ?? this.filesCacheAgeLimitTypeString,
      );

  @override
  String toString() => 'FilesCacheSettings{'
      'filesCacheSizeLimitCountTypeString: '
      '$filesCacheSizeLimitCountTypeString, '
      'filesCacheAgeLimitTypeString: $filesCacheAgeLimitTypeString'
      '}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilesCacheSettings &&
          runtimeType == other.runtimeType &&
          filesCacheSizeLimitCountTypeString ==
              other.filesCacheSizeLimitCountTypeString &&
          filesCacheAgeLimitTypeString == other.filesCacheAgeLimitTypeString;

  @override
  int get hashCode =>
      filesCacheSizeLimitCountTypeString.hashCode ^
      filesCacheAgeLimitTypeString.hashCode;
}
