// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_settings_local_preferences_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineSettingsLocalPreferencesAdapter
    extends TypeAdapter<TimelineSettingsLocalPreferences> {
  @override
  TimelineSettingsLocalPreferences read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelineSettingsLocalPreferences(
      onlyWithMedia: fields[1] as bool,
      onlyNoReplies: fields[2] as bool,
      onlyNoNsfwSensitive: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TimelineSettingsLocalPreferences obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.onlyWithMedia)
      ..writeByte(2)
      ..write(obj.onlyNoReplies)
      ..writeByte(3)
      ..write(obj.onlyNoNsfwSensitive);
  }
}
