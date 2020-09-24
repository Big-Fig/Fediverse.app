// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timelines_home_tab_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelinesHomeTabItemAdapter extends TypeAdapter<TimelinesHomeTabItem> {
  @override
  TimelinesHomeTabItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelinesHomeTabItem(
      label: fields[0] as String,
      timelineSettingsId: fields[1] as String,
      isPossibleToDelete: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TimelinesHomeTabItem obj) {
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

TimelinesHomeTabItem _$TimelinesHomeTabItemFromJson(Map<String, dynamic> json) {
  return TimelinesHomeTabItem(
    label: json['label'] as String,
    timelineSettingsId: json['timeline_settings_id'] as String,
    isPossibleToDelete: json['is_possible_to_delete'] as bool,
  );
}

Map<String, dynamic> _$TimelinesHomeTabItemToJson(
        TimelinesHomeTabItem instance) =>
    <String, dynamic>{
      'label': instance.label,
      'timeline_settings_id': instance.timelineSettingsId,
      'is_possible_to_delete': instance.isPossibleToDelete,
    };
