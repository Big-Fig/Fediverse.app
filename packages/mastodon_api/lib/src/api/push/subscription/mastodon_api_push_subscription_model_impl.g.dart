// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_push_subscription_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiPushSubscriptionAdapter
    extends TypeAdapter<MastodonApiPushSubscription> {
  @override
  final int typeId = 0;

  @override
  MastodonApiPushSubscription read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiPushSubscription(
      id: fields[0] as String,
      endpoint: fields[1] as String,
      alerts: fields[2] as MastodonApiPushSubscriptionAlerts,
      serverKey: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiPushSubscription obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.endpoint)
      ..writeByte(2)
      ..write(obj.alerts)
      ..writeByte(3)
      ..write(obj.serverKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiPushSubscriptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiPushSubscription _$$_MastodonApiPushSubscriptionFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiPushSubscription(
      id: JsonParseHelper.toStringFromAny(json['id']),
      endpoint: json['endpoint'] as String,
      alerts: MastodonApiPushSubscriptionAlerts.fromJson(
          json['alerts'] as Map<String, dynamic>),
      serverKey: json['server_key'] as String,
    );

Map<String, dynamic> _$$_MastodonApiPushSubscriptionToJson(
        _$_MastodonApiPushSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endpoint': instance.endpoint,
      'alerts': instance.alerts.toJson(),
      'server_key': instance.serverKey,
    };
