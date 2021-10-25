// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_scheduled_status_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiScheduledStatusMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiScheduledStatusMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiScheduledStatusMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiScheduledStatusMastodonAdapter(
      fields[0] as MastodonApiScheduledStatus,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiScheduledStatusMastodonAdapter obj) {
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
      other is UnifediApiScheduledStatusMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiScheduledStatusMastodonAdapter
    _$$_UnifediApiScheduledStatusMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiScheduledStatusMastodonAdapter(
          MastodonApiScheduledStatus.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiScheduledStatusMastodonAdapterToJson(
        _$_UnifediApiScheduledStatusMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
