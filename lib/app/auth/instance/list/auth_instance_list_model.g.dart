// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_instance_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInstanceListAdapter extends TypeAdapter<AuthInstanceList> {
  @override
  AuthInstanceList read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthInstanceList(
      instances: (fields[0] as List)?.cast<AuthInstance>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthInstanceList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.instances);
  }
}
