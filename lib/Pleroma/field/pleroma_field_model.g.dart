// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_field_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaFieldAdapter extends TypeAdapter<PleromaField> {
  @override
  PleromaField read(BinaryReader reader) {
    var obj = PleromaField();
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
  void write(BinaryWriter writer, PleromaField obj) {
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

PleromaField _$PleromaFieldFromJson(Map<String, dynamic> json) {
  return PleromaField(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$PleromaFieldToJson(PleromaField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
