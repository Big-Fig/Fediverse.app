// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_instance_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInstanceListAdapter extends TypeAdapter<AuthInstanceList> {
  @override
  AuthInstanceList read(BinaryReader reader) {
    var obj = AuthInstanceList();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.instances = (reader.read() as List)?.cast<AuthInstance>();
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, AuthInstanceList obj) {
    writer.writeByte(1);
    writer.writeByte(0);
    writer.write(obj.instances);
  }
}
