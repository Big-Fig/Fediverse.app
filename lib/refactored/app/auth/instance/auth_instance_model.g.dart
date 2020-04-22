// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_instance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInstanceAdapter extends TypeAdapter<AuthInstance> {
  @override
  AuthInstance read(BinaryReader reader) {
    var obj = AuthInstance();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.urlSchema = reader.read() as String;
          break;
        case 1:
          obj.urlHost = reader.read() as String;
          break;
        case 2:
          obj.acct = reader.read() as String;
          break;
        case 3:
          obj.token = reader.read() as PleromaOAuthToken;
          break;
        case 4:
          obj.authCode = reader.read() as String;
          break;
        case 5:
          obj.isPleromaInstance = reader.read() as bool;
          break;
        case 6:
          obj.application = reader.read() as PleromaClientApplication;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, AuthInstance obj) {
    writer.writeByte(7);
    writer.writeByte(0);
    writer.write(obj.urlSchema);
    writer.writeByte(1);
    writer.write(obj.urlHost);
    writer.writeByte(2);
    writer.write(obj.acct);
    writer.writeByte(3);
    writer.write(obj.token);
    writer.writeByte(4);
    writer.write(obj.authCode);
    writer.writeByte(5);
    writer.write(obj.isPleromaInstance);
    writer.writeByte(6);
    writer.write(obj.application);
  }
}
