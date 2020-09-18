// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyAccountSettingsAdapter extends TypeAdapter<MyAccountSettings> {
  @override
  MyAccountSettings read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyAccountSettings(
      isRealtimeWebSocketsEnabled: fields[0] as bool,
      isNewChatsEnabled: fields[1] as bool,
      isAlwaysShowSpoiler: fields[2] as bool,
      isAlwaysShowNsfw: fields[3] as bool,
      defaultVisibility: fields[4] as String,
      markMediaNsfwByDefault: fields[5] as bool,
      foregroundSoundForChatAndDm: fields[6] as bool,
      foregroundSoundForMention: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MyAccountSettings obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.isRealtimeWebSocketsEnabled)
      ..writeByte(1)
      ..write(obj.isNewChatsEnabled)
      ..writeByte(2)
      ..write(obj.isAlwaysShowSpoiler)
      ..writeByte(3)
      ..write(obj.isAlwaysShowNsfw)
      ..writeByte(4)
      ..write(obj.defaultVisibility)
      ..writeByte(5)
      ..write(obj.markMediaNsfwByDefault)
      ..writeByte(6)
      ..write(obj.foregroundSoundForChatAndDm)
      ..writeByte(7)
      ..write(obj.foregroundSoundForMention);
  }
}
