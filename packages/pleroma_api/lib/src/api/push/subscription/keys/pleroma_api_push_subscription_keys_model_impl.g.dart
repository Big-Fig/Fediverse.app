// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_push_subscription_keys_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiPushSubscriptionKeysAdapter
    extends TypeAdapter<PleromaApiPushSubscriptionKeys> {
  @override
  final int typeId = 0;

  @override
  PleromaApiPushSubscriptionKeys read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiPushSubscriptionKeys(
      p256dh: fields[0] as String,
      auth: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiPushSubscriptionKeys obj) {
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
      other is PleromaApiPushSubscriptionKeysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiPushSubscriptionKeys _$$_PleromaApiPushSubscriptionKeysFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiPushSubscriptionKeys(
      p256dh: json['p256dh'] as String,
      auth: json['auth'] as String,
    );

Map<String, dynamic> _$$_PleromaApiPushSubscriptionKeysToJson(
        _$_PleromaApiPushSubscriptionKeys instance) =>
    <String, dynamic>{
      'p256dh': instance.p256dh,
      'auth': instance.auth,
    };
