// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Client.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientAdapter extends TypeAdapter<Client> {
  @override
  Client read(BinaryReader reader) {
    var obj = Client();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.accessToken = reader.read() as String;
          break;
        case 1:
          obj.baseURL = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, Client obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.accessToken);
    writer.writeByte(1);
    writer.write(obj.baseURL);
  }
}
