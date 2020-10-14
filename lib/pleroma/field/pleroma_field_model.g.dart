// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_field_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaFieldAdapter extends TypeAdapter<PleromaField> {
  @override
  PleromaField read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaField(
      name: fields[0] as String,
      value: fields[1] as String,
      verifiedAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaField obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.verifiedAt);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaField _$PleromaFieldFromJson(Map<String, dynamic> json) {
  return PleromaField(
    name: json['name'] as String,
    value: json['value'] as String,
    verifiedAt: json['verified_at'] == null
        ? null
        : DateTime.parse(json['verified_at'] as String),
  );
}

Map<String, dynamic> _$PleromaFieldToJson(PleromaField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'verified_at': instance.verifiedAt?.toIso8601String(),
    };
