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
        case 2:
          obj.isAlwaysShowSpoiler = reader.read() as bool;
          break;
        case 3:
          obj.isAlwaysShowNsfw = reader.read() as bool;
          break;
        case 4:
          obj.defaultVisibility = reader.read() as PleromaVisibility;
          break;
        case 5:
          obj.markMediaNsfwByDefault = reader.read() as bool;
          break;
        case 6:
          obj.foregroundSoundForChatAndDm = reader.read() as bool;
          break;
        case 7:
          obj.foregroundSoundForMention = reader.read() as bool;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, MyAccountSettings obj) {
    writer.writeByte(8);
    writer.writeByte(0);
    writer.write(obj.isRealtimeWebSocketsEnabled);
    writer.writeByte(1);
    writer.write(obj.isNewChatsEnabled);
    writer.writeByte(2);
    writer.write(obj.isAlwaysShowSpoiler);
    writer.writeByte(3);
    writer.write(obj.isAlwaysShowNsfw);
    writer.writeByte(4);
    writer.write(obj.defaultVisibility);
    writer.writeByte(5);
    writer.write(obj.markMediaNsfwByDefault);
    writer.writeByte(6);
    writer.write(obj.foregroundSoundForChatAndDm);
    writer.writeByte(7);
    writer.write(obj.foregroundSoundForMention);
  }
}
