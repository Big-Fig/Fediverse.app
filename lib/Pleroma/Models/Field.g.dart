// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Field.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FieldAdapter extends TypeAdapter<Field> {
  @override
  Field read(BinaryReader reader) {
    var obj = Field();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.name = reader.read() as String;
          break;
        case 1:
          obj.value = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, Field obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.name);
    writer.writeByte(1);
    writer.write(obj.value);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Field _$FieldFromJson(Map<String, dynamic> json) {
  return Field(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
