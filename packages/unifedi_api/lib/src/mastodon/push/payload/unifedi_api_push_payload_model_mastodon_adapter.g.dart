// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_payload_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushPayloadMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPushPayloadMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushPayloadMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushPayloadMastodonAdapter(
      fields[0] as MastodonApiPushPayload,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPushPayloadMastodonAdapter obj) {
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
      other is UnifediApiPushPayloadMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushPayloadMastodonAdapter
    _$$_UnifediApiPushPayloadMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushPayloadMastodonAdapter(
          MastodonApiPushPayload.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPushPayloadMastodonAdapterToJson(
        _$_UnifediApiPushPayloadMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
