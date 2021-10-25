// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_instance_stats_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiInstanceStatsAdapter
    extends TypeAdapter<PleromaApiInstanceStats> {
  @override
  final int typeId = 0;

  @override
  PleromaApiInstanceStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstanceStats(
      userCount: fields[0] as int?,
      statusCount: fields[1] as int?,
      domainCount: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstanceStats obj) {
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
      other is PleromaApiInstanceStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiInstanceStats _$$_PleromaApiInstanceStatsFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiInstanceStats(
      userCount: json['user_count'] as int?,
      statusCount: json['status_count'] as int?,
      domainCount: json['domain_count'] as int?,
    );

Map<String, dynamic> _$$_PleromaApiInstanceStatsToJson(
    _$_PleromaApiInstanceStats instance) {
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
