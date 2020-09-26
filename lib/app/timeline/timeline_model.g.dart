// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineAdapter extends TypeAdapter<Timeline> {
  @override
  Timeline read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timeline(
      label: fields[0] as String,
      timelineSettingsId: fields[1] as String,
      isPossibleToDelete: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Timeline obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.timelineSettingsId)
      ..writeByte(2)
      ..write(obj.isPossibleToDelete);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timeline _$TimelineFromJson(Map<String, dynamic> json) {
  return Timeline(
    label: json['label'] as String,
    timelineSettingsId: json['timeline_settings_id'] as String,
    isPossibleToDelete: json['is_possible_to_delete'] as bool,
  );
}

Map<String, dynamic> _$TimelineToJson(Timeline instance) => <String, dynamic>{
      'label': instance.label,
      'timeline_settings_id': instance.timelineSettingsId,
      'is_possible_to_delete': instance.isPossibleToDelete,
    };
