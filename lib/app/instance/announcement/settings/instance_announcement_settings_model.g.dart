// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance_announcement_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InstanceAnnouncementSettingsAdapter
    extends TypeAdapter<InstanceAnnouncementSettings> {
  @override
  final int typeId = 69;

  @override
  InstanceAnnouncementSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InstanceAnnouncementSettings(
      withDismissed: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, InstanceAnnouncementSettings obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.withDismissed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceAnnouncementSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstanceAnnouncementSettings _$InstanceAnnouncementSettingsFromJson(
    Map<String, dynamic> json) {
  return InstanceAnnouncementSettings(
    withDismissed: json['withDismissed'] as bool,
  );
}

Map<String, dynamic> _$InstanceAnnouncementSettingsToJson(
        InstanceAnnouncementSettings instance) =>
    <String, dynamic>{
      'withDismissed': instance.withDismissed,
    };
