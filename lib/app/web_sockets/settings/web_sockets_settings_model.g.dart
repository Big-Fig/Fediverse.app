// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_sockets_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WebSocketsSettingsAdapter extends TypeAdapter<WebSocketsSettings> {
  @override
  final int typeId = 57;

  @override
  WebSocketsSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WebSocketsSettings(
      typeString: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WebSocketsSettings obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.typeString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebSocketsSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketsSettings _$WebSocketsSettingsFromJson(Map<String, dynamic> json) {
  return WebSocketsSettings(
    typeString: json['type_string'] as String?,
  );
}

Map<String, dynamic> _$WebSocketsSettingsToJson(WebSocketsSettings instance) =>
    <String, dynamic>{
      'type_string': instance.typeString,
    };
