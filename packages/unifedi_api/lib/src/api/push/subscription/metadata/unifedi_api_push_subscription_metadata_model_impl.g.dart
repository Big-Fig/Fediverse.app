// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_subscription_metadata_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushSubscriptionMetadataAdapter
    extends TypeAdapter<UnifediApiPushSubscriptionMetadata> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushSubscriptionMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushSubscriptionMetadata(
      endpoint: fields[0] as String?,
      keys: fields[1] as UnifediApiPushSubscriptionKeys?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPushSubscriptionMetadata obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.endpoint)
      ..writeByte(1)
      ..write(obj.keys);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiPushSubscriptionMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushSubscribeRequestSubscription
    _$$_UnifediApiPushSubscribeRequestSubscriptionFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushSubscribeRequestSubscription(
          endpoint: json['endpoint'] as String?,
          keys: json['keys'] == null
              ? null
              : UnifediApiPushSubscriptionKeys.fromJson(
                  json['keys'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPushSubscribeRequestSubscriptionToJson(
    _$_UnifediApiPushSubscribeRequestSubscription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endpoint', instance.endpoint);
  writeNotNull('keys', instance.keys?.toJson());
  return val;
}
