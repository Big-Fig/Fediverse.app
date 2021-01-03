import 'dart:convert';

import 'package:fedi/app/cache/database/database_cache_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'database_cache_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 96)
class DatabaseCacheSettings
    implements IJsonObject, ISettings<DatabaseCacheSettings> {
  @HiveField(2)
  @JsonKey(name: "entries_count_by_type_limit_type")
  final String entriesCountByTypeLimitTypeString;

  DatabaseCacheEntriesCountByTypeLimitType get entriesCountByTypeLimitType =>
      entriesCountByTypeLimitTypeString
          ?.toDatabaseCacheEntriesCountByTypeLimitType();

  @HiveField(3)
  @JsonKey(name: "age_limit_in_microseconds_type")
  final String ageLimitTypeString;

  DatabaseCacheAgeLimitType get ageLimitType =>
      entriesCountByTypeLimitTypeString?.toDatabaseCacheAgeLimitType();

  DatabaseCacheSettings({
    @required this.entriesCountByTypeLimitTypeString,
    @required this.ageLimitTypeString,
  });

  factory DatabaseCacheSettings.fromJson(Map<String, dynamic> json) =>
      _$DatabaseCacheSettingsFromJson(json);

  factory DatabaseCacheSettings.fromJsonString(String jsonString) =>
      _$DatabaseCacheSettingsFromJson(jsonDecode(jsonString));

  static List<DatabaseCacheSettings> listFromJsonString(String str) =>
      List<DatabaseCacheSettings>.from(
          json.decode(str).map((x) => DatabaseCacheSettings.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$DatabaseCacheSettingsToJson(this);

  String toJsonString() => jsonEncode(_$DatabaseCacheSettingsToJson(this));

  @override
  DatabaseCacheSettings clone() => copyWith();

  DatabaseCacheSettings copyWith({
    String entriesCountByTypeLimitTypeString,
    String ageLimitTypeString,
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
        'entriesCountByTypeLimitTypeString: $entriesCountByTypeLimitTypeString,'
        ' ageLimitTypeString: $ageLimitTypeString}';
  }
}
