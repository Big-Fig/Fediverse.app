// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_field_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaFieldAdapter extends TypeAdapter<PleromaField> {
  @override
  final int typeId = 5;

  @override
  PleromaField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaField(
      name: fields[0] as String?,
      value: fields[1] as String?,
      verifiedAt: fields[2] as DateTime?,
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaField _$PleromaFieldFromJson(Map<String, dynamic> json) {
  return PleromaField(
    name: json['name'] as String?,
    value: json['value'] as String?,
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
