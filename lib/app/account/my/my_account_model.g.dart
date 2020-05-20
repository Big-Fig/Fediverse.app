// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyAccountRemoteWrapperAdapter
    extends TypeAdapter<MyAccountRemoteWrapper> {
  @override
  MyAccountRemoteWrapper read(BinaryReader reader) {
    var obj = MyAccountRemoteWrapper();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.remoteAccount = reader.read() as PleromaMyAccount;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, MyAccountRemoteWrapper obj) {
    writer.writeByte(1);
    writer.writeByte(0);
    writer.write(obj.remoteAccount);
  }
}
