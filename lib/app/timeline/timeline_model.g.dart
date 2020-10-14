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
      id: fields[0] as String,
      typeString: fields[3] as String,
      settings: fields[4] as TimelineSettings,
      label: fields[1] as String,
      isPossibleToDelete: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Timeline obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.isPossibleToDelete)
      ..writeByte(3)
      ..write(obj.typeString)
      ..writeByte(4)
      ..write(obj.settings);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timeline _$TimelineFromJson(Map<String, dynamic> json) {
  return Timeline(
    id: json['id'] as String,
    typeString: json['type_string'] as String,
    settings: json['settings'] == null
        ? null
        : TimelineSettings.fromJson(json['settings'] as Map<String, dynamic>),
    label: json['label'] as String,
    isPossibleToDelete: json['is_possible_to_delete'] as bool,
  );
}

Map<String, dynamic> _$TimelineToJson(Timeline instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'is_possible_to_delete': instance.isPossibleToDelete,
      'type_string': instance.typeString,
      'settings': instance.settings?.toJson(),
    };
