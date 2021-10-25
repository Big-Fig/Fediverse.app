// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_subscription_alerts_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushSubscriptionAlertsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiPushSubscriptionAlertsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushSubscriptionAlertsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushSubscriptionAlertsPleromaAdapter(
      fields[0] as PleromaApiPushSubscriptionAlerts,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiPushSubscriptionAlertsPleromaAdapter obj) {
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
      other is UnifediApiPushSubscriptionAlertsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushSubscriptionAlertsPleromaAdapter
    _$$_UnifediApiPushSubscriptionAlertsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushSubscriptionAlertsPleromaAdapter(
          PleromaApiPushSubscriptionAlerts.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPushSubscriptionAlertsPleromaAdapterToJson(
        _$_UnifediApiPushSubscriptionAlertsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
