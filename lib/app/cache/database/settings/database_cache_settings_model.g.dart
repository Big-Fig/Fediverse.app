// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_cache_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseCacheSettingsAdapter extends TypeAdapter<DatabaseCacheSettings> {
  @override
  final int typeId = 64;

  @override
  DatabaseCacheSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseCacheSettings(
      entriesCountByTypeLimitTypeString: fields[2] as String,
      ageLimitTypeString: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DatabaseCacheSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(2)
      ..write(obj.entriesCountByTypeLimitTypeString)
      ..writeByte(3)
      ..write(obj.ageLimitTypeString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseCacheSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseCacheSettings _$DatabaseCacheSettingsFromJson(
        Map<String, dynamic> json) =>
    DatabaseCacheSettings(
      entriesCountByTypeLimitTypeString:
          json['entries_count_by_type_limit_type'] as String,
      ageLimitTypeString: json['age_limit_in_microseconds_type'] as String,
    );

Map<String, dynamic> _$DatabaseCacheSettingsToJson(
        DatabaseCacheSettings instance) =>
    <String, dynamic>{
      'entries_count_by_type_limit_type':
          instance.entriesCountByTypeLimitTypeString,
      'age_limit_in_microseconds_type': instance.ageLimitTypeString,
    };
