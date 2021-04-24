import 'package:fedi/app/cache/database/cache/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/cache/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'database_cache_settings_model.g.dart';

// ignore_for_file: no-magic-number
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 96)
class DatabaseCacheSettings
    implements IJsonObject, ISettings<DatabaseCacheSettings> {
  @HiveField(2)
  @JsonKey(name: "entries_count_by_type_limit_type")
  final String entriesCountByTypeLimitTypeString;

  DatabaseCacheEntriesCountByTypeLimitType get entriesCountByTypeLimitType =>
      entriesCountByTypeLimitTypeString
          .toDatabaseCacheEntriesCountByTypeLimitType();

  @HiveField(3)
  @JsonKey(name: "age_limit_in_microseconds_type")
  final String ageLimitTypeString;

  DatabaseCacheAgeLimitType get ageLimitType =>
      ageLimitTypeString.toDatabaseCacheAgeLimitType();

  DatabaseCacheSettings({
    required this.entriesCountByTypeLimitTypeString,
    required this.ageLimitTypeString,
  });

  static DatabaseCacheSettings fromJson(Map<String, dynamic> json) =>
      _$DatabaseCacheSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DatabaseCacheSettingsToJson(this);

  @override
  DatabaseCacheSettings clone() => copyWith();

  DatabaseCacheSettings copyWith({
    String? entriesCountByTypeLimitTypeString,
    String? ageLimitTypeString,
  }) =>
      DatabaseCacheSettings(
        entriesCountByTypeLimitTypeString: entriesCountByTypeLimitTypeString ??
            this.entriesCountByTypeLimitTypeString,
        ageLimitTypeString: ageLimitTypeString ?? this.ageLimitTypeString,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseCacheSettings &&
          runtimeType == other.runtimeType &&
          entriesCountByTypeLimitTypeString ==
              other.entriesCountByTypeLimitTypeString &&
          ageLimitTypeString == other.ageLimitTypeString;

  @override
  int get hashCode =>
      entriesCountByTypeLimitTypeString.hashCode ^ ageLimitTypeString.hashCode;

  @override
  String toString() {
    return 'DatabaseCacheSettings{'
        'entriesCountByTypeLimitTypeString: $entriesCountByTypeLimitTypeString, '
        'ageLimitTypeString: $ageLimitTypeString'
        '}';
  }
}
