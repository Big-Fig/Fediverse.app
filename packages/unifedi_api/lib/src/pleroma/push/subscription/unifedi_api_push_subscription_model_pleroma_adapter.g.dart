// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_subscription_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushSubscriptionPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiPushSubscriptionPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushSubscriptionPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushSubscriptionPleromaAdapter(
      fields[0] as PleromaApiPushSubscription,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiPushSubscriptionPleromaAdapter obj) {
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
      other is UnifediApiPushSubscriptionPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushSubscriptionPleromaAdapter
    _$$_UnifediApiPushSubscriptionPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushSubscriptionPleromaAdapter(
          PleromaApiPushSubscription.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPushSubscriptionPleromaAdapterToJson(
        _$_UnifediApiPushSubscriptionPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
