// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_push_subscription_keys_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiPushSubscriptionKeysAdapter
    extends TypeAdapter<MastodonApiPushSubscriptionKeys> {
  @override
  final int typeId = 0;

  @override
  MastodonApiPushSubscriptionKeys read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiPushSubscriptionKeys(
      p256dh: fields[0] as String,
      auth: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiPushSubscriptionKeys obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.p256dh)
      ..writeByte(1)
      ..write(obj.auth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiPushSubscriptionKeysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiPushSubscriptionKeys _$$_MastodonApiPushSubscriptionKeysFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiPushSubscriptionKeys(
      p256dh: json['p256dh'] as String,
      auth: json['auth'] as String,
    );

Map<String, dynamic> _$$_MastodonApiPushSubscriptionKeysToJson(
        _$_MastodonApiPushSubscriptionKeys instance) =>
    <String, dynamic>{
      'p256dh': instance.p256dh,
      'auth': instance.auth,
    };
