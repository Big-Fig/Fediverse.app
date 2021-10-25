import 'package:fedi_app/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi_app/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi_app/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'database_cache_settings_model.freezed.dart';

part 'database_cache_settings_model.g.dart';

// ignore_for_file: no-magic-number
@freezed
@HiveType(typeId: -32 + 96)
class DatabaseCacheSettings
    with _$DatabaseCacheSettings
    implements IJsonObj, ISettings<DatabaseCacheSettings> {
  const DatabaseCacheSettings._();

  const factory DatabaseCacheSettings({
    @HiveField(2)
    @JsonKey(
      name: 'entries_count_by_type_limit_type',
    )
        required String entriesCountByTypeLimitTypeString,
    @HiveField(3)
    @JsonKey(
      name: 'age_limit_in_microseconds_type',
    )
        required String ageLimitTypeString,
  }) = _DatabaseCacheSettings;

  DatabaseCacheEntriesCountByTypeLimitType get entriesCountByTypeLimitType =>
      entriesCountByTypeLimitTypeString
          .toDatabaseCacheEntriesCountByTypeLimitType();

  DatabaseCacheAgeLimitType get ageLimitType =>
      ageLimitTypeString.toDatabaseCacheAgeLimitType();

  static DatabaseCacheSettings fromEnum({
    required DatabaseCacheEntriesCountByTypeLimitType
        entriesCountByTypeLimitType,
    required DatabaseCacheAgeLimitType ageLimitType,
  }) =>
      DatabaseCacheSettings(
        entriesCountByTypeLimitTypeString:
            entriesCountByTypeLimitType.toJsonValue(),
        ageLimitTypeString: ageLimitType.toJsonValue(),
      );

  factory DatabaseCacheSettings.fromJson(Map<String, dynamic> json) =>
      _$DatabaseCacheSettingsFromJson(json);
}
