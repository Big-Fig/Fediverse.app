// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyAccountSettingsAdapter extends TypeAdapter<MyAccountSettings> {
  @override
  MyAccountSettings read(BinaryReader reader) {
    var obj = MyAccountSettings();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.isRealtimeWebSocketsEnabled = reader.read() as bool;
          break;
        case 1:
          obj.isNewChatsEnabled = reader.read() as bool;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, MyAccountSettings obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.isRealtimeWebSocketsEnabled);
    writer.writeByte(1);
    writer.write(obj.isNewChatsEnabled);
  }
}
