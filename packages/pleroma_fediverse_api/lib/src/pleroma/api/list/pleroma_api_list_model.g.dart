// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiListAdapter extends TypeAdapter<PleromaApiList> {
  @override
  final int typeId = 48;

  @override
  PleromaApiList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiList(
      id: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiList obj) {
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
      other is PleromaApiListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiList _$PleromaApiListFromJson(Map<String, dynamic> json) {
  return PleromaApiList(
    id: json['id'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$PleromaApiListToJson(PleromaApiList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
