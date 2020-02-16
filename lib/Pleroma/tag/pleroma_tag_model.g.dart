// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_tag_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaTagAdapter extends TypeAdapter<PleromaTag> {
  @override
  PleromaTag read(BinaryReader reader) {
    var obj = PleromaTag();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.name = reader.read() as String;
          break;
        case 1:
          obj.url = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaTag obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.name);
    writer.writeByte(1);
    writer.write(obj.url);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaTag _$PleromaTagFromJson(Map<String, dynamic> json) {
  return PleromaTag(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$PleromaTagToJson(PleromaTag instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
