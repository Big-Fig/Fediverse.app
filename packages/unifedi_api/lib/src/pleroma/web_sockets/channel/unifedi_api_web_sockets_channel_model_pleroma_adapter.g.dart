// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_web_sockets_channel_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiWebSocketsChannelPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiWebSocketsChannelPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiWebSocketsChannelPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiWebSocketsChannelPleromaAdapter(
      fields[0] as PleromaApiWebSocketsChannel,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiWebSocketsChannelPleromaAdapter obj) {
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
      other is UnifediApiWebSocketsChannelPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiWebSocketsChannelPleromaAdapter
    _$$_UnifediApiWebSocketsChannelPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiWebSocketsChannelPleromaAdapter(
          PleromaApiWebSocketsChannel.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiWebSocketsChannelPleromaAdapterToJson(
        _$_UnifediApiWebSocketsChannelPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
