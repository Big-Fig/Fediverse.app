// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_stats_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceStatsMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceStatsMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceStatsMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceStatsMastodonAdapter(
      fields[0] as MastodonApiInstanceStats,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceStatsMastodonAdapter obj) {
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
      other is UnifediApiInstanceStatsMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceStatsMastodonAdapter
    _$$_UnifediApiInstanceStatsMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceStatsMastodonAdapter(
          MastodonApiInstanceStats.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceStatsMastodonAdapterToJson(
        _$_UnifediApiInstanceStatsMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
