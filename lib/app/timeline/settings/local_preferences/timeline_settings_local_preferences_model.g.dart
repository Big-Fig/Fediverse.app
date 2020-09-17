// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_settings_local_preferences_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineSettingsLocalPreferencesAdapter
    extends TypeAdapter<TimelineSettingsLocalPreferences> {
  @override
  final int typeId = 14;

  @override
  TimelineSettingsLocalPreferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineSettingsLocalPreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
