// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaSettingsAdapter extends TypeAdapter<MediaSettings> {
  @override
  final int typeId = 53;

  @override
  MediaSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MediaSettings(
      autoInit: fields[0] as bool,
      autoPlay: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MediaSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.autoInit)
      ..writeByte(1)
      ..write(obj.autoPlay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaSettings _$MediaSettingsFromJson(Map<String, dynamic> json) {
  return MediaSettings(
    autoInit: json['auto_init'] as bool,
    autoPlay: json['auto_play'] as bool,
  );
}

Map<String, dynamic> _$MediaSettingsToJson(MediaSettings instance) =>
    <String, dynamic>{
      'auto_init': instance.autoInit,
      'auto_play': instance.autoPlay,
    };
