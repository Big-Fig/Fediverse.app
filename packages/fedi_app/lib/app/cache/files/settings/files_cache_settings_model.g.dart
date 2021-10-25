// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_cache_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilesCacheSettingsAdapter extends TypeAdapter<FilesCacheSettings> {
  @override
  final int typeId = 65;

  @override
  FilesCacheSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilesCacheSettings(
      sizeLimitCountTypeString: fields[2] as String,
      ageLimitTypeString: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FilesCacheSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(2)
      ..write(obj.sizeLimitCountTypeString)
      ..writeByte(3)
      ..write(obj.ageLimitTypeString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilesCacheSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilesCacheSettings _$$_FilesCacheSettingsFromJson(
        Map<String, dynamic> json) =>
    _$_FilesCacheSettings(
      sizeLimitCountTypeString:
          json['files_cache_size_limit_count_type_string'] as String,
      ageLimitTypeString: json['files_cache_ageL_limit_type_string'] as String,
    );

Map<String, dynamic> _$$_FilesCacheSettingsToJson(
        _$_FilesCacheSettings instance) =>
    <String, dynamic>{
      'files_cache_size_limit_count_type_string':
          instance.sizeLimitCountTypeString,
      'files_cache_ageL_limit_type_string': instance.ageLimitTypeString,
    };
