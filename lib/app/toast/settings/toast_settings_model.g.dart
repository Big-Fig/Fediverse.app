// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToastSettingsAdapter extends TypeAdapter<ToastSettings> {
  @override
  final int typeId = 54;

  @override
  ToastSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToastSettings(
      pushSettings: fields[3] as PushSettings,
      handlingTypeString: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ToastSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(3)
      ..write(obj.pushSettings)
      ..writeByte(4)
      ..write(obj.handlingTypeString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToastSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToastSettings _$ToastSettingsFromJson(Map<String, dynamic> json) {
  return ToastSettings(
    pushSettings:
        PushSettings.fromJson(json['push_settings'] as Map<String, dynamic>),
    handlingTypeString: json['handling_type_string'] as String,
  );
}

Map<String, dynamic> _$ToastSettingsToJson(ToastSettings instance) =>
    <String, dynamic>{
      'push_settings': instance.pushSettings.toJson(),
      'handling_type_string': instance.handlingTypeString,
    };
