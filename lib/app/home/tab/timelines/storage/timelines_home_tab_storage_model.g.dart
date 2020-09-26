// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timelines_home_tab_storage_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelinesHomeTabStorageAdapter
    extends TypeAdapter<TimelinesHomeTabStorage> {
  @override
  TimelinesHomeTabStorage read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelinesHomeTabStorage(
      timelineIds: (fields[0] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TimelinesHomeTabStorage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.timelineIds);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelinesHomeTabStorage _$TimelinesHomeTabStorageFromJson(
    Map<String, dynamic> json) {
  return TimelinesHomeTabStorage(
    timelineIds:
        (json['timeline_ids'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TimelinesHomeTabStorageToJson(
        TimelinesHomeTabStorage instance) =>
    <String, dynamic>{
      'timeline_ids': instance.timelineIds,
    };
