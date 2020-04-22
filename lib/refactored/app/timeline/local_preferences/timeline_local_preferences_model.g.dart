// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_local_preferences_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineLocalPreferencesAdapter
    extends TypeAdapter<TimelineLocalPreferences> {
  @override
  TimelineLocalPreferences read(BinaryReader reader) {
    var obj = TimelineLocalPreferences();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.onlyWithMedia = reader.read() as bool;
          break;
        case 2:
          obj.onlyNoReplies = reader.read() as bool;
          break;
        case 3:
          obj.onlyNoNsfwSensitive = reader.read() as bool;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, TimelineLocalPreferences obj) {
    writer.writeByte(3);
    writer.writeByte(1);
    writer.write(obj.onlyWithMedia);
    writer.writeByte(2);
    writer.write(obj.onlyNoReplies);
    writer.writeByte(3);
    writer.write(obj.onlyNoNsfwSensitive);
  }
}
