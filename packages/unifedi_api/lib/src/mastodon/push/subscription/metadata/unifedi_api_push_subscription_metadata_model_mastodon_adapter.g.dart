// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_subscription_metadata_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushSubscriptionMetadataMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPushSubscriptionMetadataMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushSubscriptionMetadataMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushSubscriptionMetadataMastodonAdapter(
      fields[0] as MastodonApiPushSubscriptionMetadata,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiPushSubscriptionMetadataMastodonAdapter obj) {
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
      other is UnifediApiPushSubscriptionMetadataMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushSubscriptionMetadataMastodonAdapter
    _$$_UnifediApiPushSubscriptionMetadataMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushSubscriptionMetadataMastodonAdapter(
          MastodonApiPushSubscriptionMetadata.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$_UnifediApiPushSubscriptionMetadataMastodonAdapterToJson(
            _$_UnifediApiPushSubscriptionMetadataMastodonAdapter instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
        };
