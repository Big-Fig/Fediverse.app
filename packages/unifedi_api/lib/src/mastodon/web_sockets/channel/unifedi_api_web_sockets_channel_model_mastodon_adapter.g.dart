// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_web_sockets_channel_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiWebSocketsChannelMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiWebSocketsChannelMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiWebSocketsChannelMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiWebSocketsChannelMastodonAdapter(
      fields[0] as MastodonApiWebSocketsChannel,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiWebSocketsChannelMastodonAdapter obj) {
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
      other is UnifediApiWebSocketsChannelMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiWebSocketsChannelMastodonAdapter
    _$$_UnifediApiWebSocketsChannelMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiWebSocketsChannelMastodonAdapter(
          MastodonApiWebSocketsChannel.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiWebSocketsChannelMastodonAdapterToJson(
        _$_UnifediApiWebSocketsChannelMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
