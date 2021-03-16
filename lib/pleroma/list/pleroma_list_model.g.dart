// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaListAdapter extends TypeAdapter<PleromaList> {
  @override
  final int typeId = 48;

  @override
  PleromaList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaList(
      id: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaList _$PleromaListFromJson(Map<String, dynamic> json) {
  return PleromaList(
    id: json['id'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$PleromaListToJson(PleromaList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
