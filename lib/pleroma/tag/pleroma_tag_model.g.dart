// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_tag_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaTagAdapter extends TypeAdapter<PleromaTag> {
  @override
  final int typeId = 42;

  @override
  PleromaTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaTag(
      name: fields[0] as String,
      url: fields[1] as String,
      history: (fields[2] as List?)?.cast<PleromaTagHistory>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaTag obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaTag _$PleromaTagFromJson(Map<String, dynamic> json) {
  return PleromaTag(
    name: json['name'] as String,
    url: json['url'] as String,
    history: (json['history'] as List<dynamic>?)
        ?.map((e) => PleromaTagHistory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PleromaTagToJson(PleromaTag instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'history': instance.history,
    };
