// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_subscription_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushSubscriptionMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPushSubscriptionMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushSubscriptionMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushSubscriptionMastodonAdapter(
      fields[0] as MastodonApiPushSubscription,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiPushSubscriptionMastodonAdapter obj) {
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
      other is UnifediApiPushSubscriptionMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushSubscriptionMastodonAdapter
    _$$_UnifediApiPushSubscriptionMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushSubscriptionMastodonAdapter(
          MastodonApiPushSubscription.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPushSubscriptionMastodonAdapterToJson(
        _$_UnifediApiPushSubscriptionMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
