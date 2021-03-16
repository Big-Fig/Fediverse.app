// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timelines_home_tab_storage_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelinesHomeTabStorageAdapter
    extends TypeAdapter<TimelinesHomeTabStorage> {
  @override
  final int typeId = 49;

  @override
  TimelinesHomeTabStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelinesHomeTabStorage(
      timelineIds: (fields[0] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TimelinesHomeTabStorage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.timelineIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelinesHomeTabStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelinesHomeTabStorage _$TimelinesHomeTabStorageFromJson(
    Map<String, dynamic> json) {
  return TimelinesHomeTabStorage(
    timelineIds: (json['timeline_ids'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$TimelinesHomeTabStorageToJson(
        TimelinesHomeTabStorage instance) =>
    <String, dynamic>{
      'timeline_ids': instance.timelineIds,
    };
