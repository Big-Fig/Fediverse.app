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
      filesCacheSizeLimitCountTypeString: fields[2] as String?,
      filesCacheAgeLimitTypeString: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FilesCacheSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(2)
      ..write(obj.filesCacheSizeLimitCountTypeString)
      ..writeByte(3)
      ..write(obj.filesCacheAgeLimitTypeString);
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

FilesCacheSettings _$FilesCacheSettingsFromJson(Map<String, dynamic> json) {
  return FilesCacheSettings(
    filesCacheSizeLimitCountTypeString:
        json['files_cache_size_limit_count_type_string'] as String?,
    filesCacheAgeLimitTypeString:
        json['files_cache_ageL_limit_type_string'] as String?,
  );
}

Map<String, dynamic> _$FilesCacheSettingsToJson(FilesCacheSettings instance) =>
    <String, dynamic>{
      'files_cache_size_limit_count_type_string':
          instance.filesCacheSizeLimitCountTypeString,
      'files_cache_ageL_limit_type_string':
          instance.filesCacheAgeLimitTypeString,
    };
