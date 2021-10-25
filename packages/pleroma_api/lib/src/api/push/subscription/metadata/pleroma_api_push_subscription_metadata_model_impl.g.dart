// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_push_subscription_metadata_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiPushSubscriptionMetadataAdapter
    extends TypeAdapter<PleromaApiPushSubscriptionMetadata> {
  @override
  final int typeId = 0;

  @override
  PleromaApiPushSubscriptionMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiPushSubscriptionMetadata(
      endpoint: fields[0] as String,
      keys: fields[1] as PleromaApiPushSubscriptionKeys,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiPushSubscriptionMetadata obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.keys)
      ..writeByte(0)
      ..write(obj.endpoint);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPushSubscriptionMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiPushSubscribeRequestSubscription
    _$$_PleromaApiPushSubscribeRequestSubscriptionFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiPushSubscribeRequestSubscription(
          endpoint: json['endpoint'] as String,
          keys: PleromaApiPushSubscriptionKeys.fromJson(
              json['keys'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_PleromaApiPushSubscribeRequestSubscriptionToJson(
        _$_PleromaApiPushSubscribeRequestSubscription instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'keys': instance.keys.toJson(),
    };
