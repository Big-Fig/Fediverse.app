// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_field_limits_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceFieldLimitsAdapter
    extends TypeAdapter<UnifediApiInstanceFieldLimits> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceFieldLimits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceFieldLimits(
      maxFields: fields[0] as int?,
      maxRemoteFields: fields[1] as int?,
      nameLength: fields[2] as int?,
      valueLength: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceFieldLimits obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.maxFields)
      ..writeByte(1)
      ..write(obj.maxRemoteFields)
      ..writeByte(2)
      ..write(obj.nameLength)
      ..writeByte(3)
      ..write(obj.valueLength);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiInstanceFieldLimitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceFieldLimits _$$_UnifediApiInstanceFieldLimitsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstanceFieldLimits(
      maxFields: json['max_fields'] as int?,
      maxRemoteFields: json['max_remote_fields'] as int?,
      nameLength: json['name_length'] as int?,
      valueLength: json['value_length'] as int?,
    );

Map<String, dynamic> _$$_UnifediApiInstanceFieldLimitsToJson(
    _$_UnifediApiInstanceFieldLimits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('max_fields', instance.maxFields);
  writeNotNull('max_remote_fields', instance.maxRemoteFields);
  writeNotNull('name_length', instance.nameLength);
  writeNotNull('value_length', instance.valueLength);
  return val;
}
