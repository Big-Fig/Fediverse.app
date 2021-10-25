// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_push_subscription_metadata_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiPushSubscriptionMetadataAdapter
    extends TypeAdapter<MastodonApiPushSubscriptionMetadata> {
  @override
  final int typeId = 0;

  @override
  MastodonApiPushSubscriptionMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiPushSubscriptionMetadata(
      endpoint: fields[0] as String,
      keys: fields[1] as MastodonApiPushSubscriptionKeys,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiPushSubscriptionMetadata obj) {
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
      other is MastodonApiPushSubscriptionMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiPushSubscribeRequestSubscription
    _$$_MastodonApiPushSubscribeRequestSubscriptionFromJson(
            Map<String, dynamic> json) =>
        _$_MastodonApiPushSubscribeRequestSubscription(
          endpoint: json['endpoint'] as String,
          keys: MastodonApiPushSubscriptionKeys.fromJson(
              json['keys'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_MastodonApiPushSubscribeRequestSubscriptionToJson(
        _$_MastodonApiPushSubscribeRequestSubscription instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'keys': instance.keys.toJson(),
    };
