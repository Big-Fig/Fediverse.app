// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_web_sockets_event_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiWebSocketsEventPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiWebSocketsEventPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiWebSocketsEventPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiWebSocketsEventPleromaAdapter(
      fields[0] as PleromaApiWebSocketsEvent,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiWebSocketsEventPleromaAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiWebSocketsEventPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiWebSocketsEventPleromaAdapter
    _$$_UnifediApiWebSocketsEventPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiWebSocketsEventPleromaAdapter(
          PleromaApiWebSocketsEvent.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiWebSocketsEventPleromaAdapterToJson(
        _$_UnifediApiWebSocketsEventPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
