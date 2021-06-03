// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizationLocaleAdapter extends TypeAdapter<LocalizationLocale> {
  @override
  final int typeId = 50;

  @override
  LocalizationLocale read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalizationLocale(
      languageCode: fields[0] as String,
      scriptCode: fields[1] as String?,
      countryCode: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalizationLocale obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.languageCode)
      ..writeByte(1)
      ..write(obj.scriptCode)
      ..writeByte(2)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizationLocaleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizationLocale _$LocalizationLocaleFromJson(Map<String, dynamic> json) {
  return LocalizationLocale(
    languageCode: json['languageCode'] as String,
    scriptCode: json['scriptCode'] as String?,
    countryCode: json['countryCode'] as String?,
  );
}

Map<String, dynamic> _$LocalizationLocaleToJson(LocalizationLocale instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'scriptCode': instance.scriptCode,
      'countryCode': instance.countryCode,
    };
