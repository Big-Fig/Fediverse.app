// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_subscription_keys_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushSubscriptionKeysMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPushSubscriptionKeysMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushSubscriptionKeysMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushSubscriptionKeysMastodonAdapter(
      fields[0] as MastodonApiPushSubscriptionKeys,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiPushSubscriptionKeysMastodonAdapter obj) {
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
      other is UnifediApiPushSubscriptionKeysMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushSubscriptionKeysMastodonAdapter
    _$$_UnifediApiPushSubscriptionKeysMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushSubscriptionKeysMastodonAdapter(
          MastodonApiPushSubscriptionKeys.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPushSubscriptionKeysMastodonAdapterToJson(
        _$_UnifediApiPushSubscriptionKeysMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
