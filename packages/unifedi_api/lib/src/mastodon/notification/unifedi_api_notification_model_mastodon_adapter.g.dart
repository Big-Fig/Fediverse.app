// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_notification_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiNotificationMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiNotificationMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiNotificationMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiNotificationMastodonAdapter(
      fields[0] as MastodonApiNotification,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiNotificationMastodonAdapter obj) {
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
      other is UnifediApiNotificationMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiNotificationMastodonAdapter
    _$$_UnifediApiNotificationMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiNotificationMastodonAdapter(
          MastodonApiNotification.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiNotificationMastodonAdapterToJson(
        _$_UnifediApiNotificationMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
