// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UiSettingsAdapter extends TypeAdapter<UiSettings> {
  @override
  final int typeId = 59;

  @override
  UiSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UiSettings(
      themeId: fields[0] as String?,
      statusFontSize: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UiSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.themeId)
      ..writeByte(1)
      ..write(obj.statusFontSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UiSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UiSettings _$UiSettingsFromJson(Map<String, dynamic> json) {
  return UiSettings(
    themeId: json['theme_id'] as String?,
    statusFontSize: json['status_font_size'] as String?,
  );
}

Map<String, dynamic> _$UiSettingsToJson(UiSettings instance) =>
    <String, dynamic>{
      'theme_id': instance.themeId,
      'status_font_size': instance.statusFontSize,
    };
