// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_stats_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceStatsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceStatsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceStatsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceStatsPleromaAdapter(
      fields[0] as PleromaApiInstanceStats,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceStatsPleromaAdapter obj) {
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
      other is UnifediApiInstanceStatsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceStatsPleromaAdapter
    _$$_UnifediApiInstanceStatsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceStatsPleromaAdapter(
          PleromaApiInstanceStats.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceStatsPleromaAdapterToJson(
        _$_UnifediApiInstanceStatsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
