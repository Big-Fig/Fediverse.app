// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_web_sockets_event_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiWebSocketsEventMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiWebSocketsEventMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiWebSocketsEventMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiWebSocketsEventMastodonAdapter(
      fields[0] as MastodonApiWebSocketsEvent,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiWebSocketsEventMastodonAdapter obj) {
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
      other is UnifediApiWebSocketsEventMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiWebSocketsEventMastodonAdapter
    _$$_UnifediApiWebSocketsEventMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiWebSocketsEventMastodonAdapter(
          MastodonApiWebSocketsEvent.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiWebSocketsEventMastodonAdapterToJson(
        _$_UnifediApiWebSocketsEventMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
