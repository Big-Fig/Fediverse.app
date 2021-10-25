// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_subscription_metadata_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushSubscriptionMetadataPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiPushSubscriptionMetadataPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushSubscriptionMetadataPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushSubscriptionMetadataPleromaAdapter(
      fields[0] as PleromaApiPushSubscriptionMetadata,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiPushSubscriptionMetadataPleromaAdapter obj) {
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
      other is UnifediApiPushSubscriptionMetadataPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushSubscriptionMetadataPleromaAdapter
    _$$_UnifediApiPushSubscriptionMetadataPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushSubscriptionMetadataPleromaAdapter(
          PleromaApiPushSubscriptionMetadata.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPushSubscriptionMetadataPleromaAdapterToJson(
        _$_UnifediApiPushSubscriptionMetadataPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
