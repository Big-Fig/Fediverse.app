// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizationLocaleAdapter extends TypeAdapter<LocalizationLocale> {
  @override
  LocalizationLocale read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalizationLocale(locale: fields[0]);
  }

  @override
  void write(BinaryWriter writer, LocalizationLocale obj) {
    writer..writeByte(0);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizationLocale _$LocalizationLocaleFromJson(Map<String, dynamic> json) {
  return LocalizationLocale(
    locale:json['locale'] as String,
  );
}

Map<String, dynamic> _$LocalizationLocaleToJson(LocalizationLocale instance) =>
    <String, dynamic>{
      'locale': instance.locale,
    };
