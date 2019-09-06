// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountAuth.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAuthAdapter extends TypeAdapter<AccountAuth> {
  @override
  AccountAuth read(BinaryReader reader) {
    var obj = AccountAuth();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.tokenType = reader.read() as String;
          break;
        case 1:
          obj.scope = reader.read() as String;
          break;
        case 2:
          obj.refreshToken = reader.read() as String;
          break;
        case 3:
          obj.me = reader.read() as String;
          break;
        case 4:
          obj.expiresIn = reader.read() as int;
          break;
        case 5:
          obj.createdAt = reader.read() as int;
          break;
        case 6:
          obj.accessToken = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, AccountAuth obj) {
    writer.writeByte(7);
    writer.writeByte(0);
    writer.write(obj.tokenType);
    writer.writeByte(1);
    writer.write(obj.scope);
    writer.writeByte(2);
    writer.write(obj.refreshToken);
    writer.writeByte(3);
    writer.write(obj.me);
    writer.writeByte(4);
    writer.write(obj.expiresIn);
    writer.writeByte(5);
    writer.write(obj.createdAt);
    writer.writeByte(6);
    writer.write(obj.accessToken);
  }
}
