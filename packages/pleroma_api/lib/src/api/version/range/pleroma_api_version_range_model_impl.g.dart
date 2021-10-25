// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_version_range_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiVersionRangeAdapter
    extends TypeAdapter<PleromaApiVersionRange> {
  @override
  final int typeId = 0;

  @override
  PleromaApiVersionRange read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiVersionRange(
      min: fields[0] as PleromaApiVersion?,
      max: fields[1] as PleromaApiVersion?,
      minInclusive: fields[2] as bool,
      maxInclusive: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiVersionRange obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.min)
      ..writeByte(1)
      ..write(obj.max)
      ..writeByte(2)
      ..write(obj.minInclusive)
      ..writeByte(3)
      ..write(obj.maxInclusive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiVersionRangeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiVersionRange _$$_PleromaApiVersionRangeFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiVersionRange(
      min: json['min'] == null
          ? null
          : PleromaApiVersion.fromJson(json['min'] as Map<String, dynamic>),
      max: json['max'] == null
          ? null
          : PleromaApiVersion.fromJson(json['max'] as Map<String, dynamic>),
      minInclusive: json['min_inclusive'] as bool? ?? true,
      maxInclusive: json['max_inclusive'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PleromaApiVersionRangeToJson(
    _$_PleromaApiVersionRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('min', instance.min?.toJson());
  writeNotNull('max', instance.max?.toJson());
  val['min_inclusive'] = instance.minInclusive;
  val['max_inclusive'] = instance.maxInclusive;
  return val;
}
