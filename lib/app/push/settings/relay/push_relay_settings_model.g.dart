// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_relay_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushRelaySettingsAdapter extends TypeAdapter<PushRelaySettings> {
  @override
  final int typeId = 71;

  @override
  PushRelaySettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushRelaySettings(
      pushRelayBaseUrl: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PushRelaySettings obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pushRelayBaseUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushRelaySettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushRelaySettings _$PushRelaySettingsFromJson(Map<String, dynamic> json) {
  return PushRelaySettings(
    pushRelayBaseUrl: json['push_relay_base_url'] as String,
  );
}

Map<String, dynamic> _$PushRelaySettingsToJson(PushRelaySettings instance) =>
    <String, dynamic>{
      'push_relay_base_url': instance.pushRelayBaseUrl,
    };
