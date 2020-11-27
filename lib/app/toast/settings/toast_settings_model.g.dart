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
    );
  }

  @override
  void write(BinaryWriter writer, ToastSettings obj) {
    writer
      ..writeByte(1)
      ..writeByte(3)
      ..write(obj.pushSettings);
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
    pushSettings: json['push_settings'] == null
        ? null
        : PushSettings.fromJson(json['push_settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ToastSettingsToJson(ToastSettings instance) =>
    <String, dynamic>{
      'push_settings': instance.pushSettings?.toJson(),
    };
