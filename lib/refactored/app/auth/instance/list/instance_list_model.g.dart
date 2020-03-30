// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InstanceListAdapter extends TypeAdapter<InstanceList> {
  @override
  InstanceList read(BinaryReader reader) {
    var obj = InstanceList();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.instances = (reader.read() as List)?.cast<Instance>();
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, InstanceList obj) {
    writer.writeByte(1);
    writer.writeByte(0);
    writer.write(obj.instances);
  }
}
