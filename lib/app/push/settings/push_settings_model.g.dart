// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushSettingsLocalPreferencesAdapter
    extends TypeAdapter<PushSettingsLocalPreferences> {
  @override
  final int typeId = 15;

  @override
  PushSettingsLocalPreferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushSettingsLocalPreferences(
      favourite: fields[1] as bool,
      follow: fields[2] as bool,
      mention: fields[3] as bool,
      reblog: fields[4] as bool,
      poll: fields[5] as bool,
      chat: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PushSettingsLocalPreferences obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.favourite)
      ..writeByte(2)
      ..write(obj.follow)
      ..writeByte(3)
      ..write(obj.mention)
      ..writeByte(4)
      ..write(obj.reblog)
      ..writeByte(5)
      ..write(obj.poll)
      ..writeByte(6)
      ..write(obj.chat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushSettingsLocalPreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushSettingsLocalPreferences _$PushSettingsLocalPreferencesFromJson(
    Map<String, dynamic> json) {
  return PushSettingsLocalPreferences(
    favourite: json['favourite'] as bool,
    follow: json['follow'] as bool,
    mention: json['mention'] as bool,
    reblog: json['reblog'] as bool,
    poll: json['poll'] as bool,
    chat: json['chat'] as bool,
  );
}

Map<String, dynamic> _$PushSettingsLocalPreferencesToJson(
        PushSettingsLocalPreferences instance) =>
    <String, dynamic>{
      'favourite': instance.favourite,
      'follow': instance.follow,
      'mention': instance.mention,
      'reblog': instance.reblog,
      'poll': instance.poll,
      'chat': instance.chat,
    };
