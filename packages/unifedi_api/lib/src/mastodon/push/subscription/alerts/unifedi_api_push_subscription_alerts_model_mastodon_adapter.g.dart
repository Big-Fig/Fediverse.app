// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_subscription_alerts_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushSubscriptionAlertsMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPushSubscriptionAlertsMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushSubscriptionAlertsMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushSubscriptionAlertsMastodonAdapter(
      fields[0] as MastodonApiPushSubscriptionAlerts,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiPushSubscriptionAlertsMastodonAdapter obj) {
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
      other is UnifediApiPushSubscriptionAlertsMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushSubscriptionAlertsMastodonAdapter
    _$$_UnifediApiPushSubscriptionAlertsMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushSubscriptionAlertsMastodonAdapter(
          MastodonApiPushSubscriptionAlerts.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPushSubscriptionAlertsMastodonAdapterToJson(
        _$_UnifediApiPushSubscriptionAlertsMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
