// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_stats_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceStatsAdapter
    extends TypeAdapter<UnifediApiInstanceStats> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceStats(
      userCount: fields[0] as int?,
      statusCount: fields[1] as int?,
      domainCount: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceStats obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userCount)
      ..writeByte(1)
      ..write(obj.statusCount)
      ..writeByte(2)
      ..write(obj.domainCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiInstanceStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceStats _$$_UnifediApiInstanceStatsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstanceStats(
      userCount: json['user_count'] as int?,
      statusCount: json['status_count'] as int?,
      domainCount: json['domain_count'] as int?,
    );

Map<String, dynamic> _$$_UnifediApiInstanceStatsToJson(
    _$_UnifediApiInstanceStats instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_count', instance.userCount);
  writeNotNull('status_count', instance.statusCount);
  writeNotNull('domain_count', instance.domainCount);
  return val;
}
