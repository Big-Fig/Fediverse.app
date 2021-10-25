// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_list_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiListAdapter extends TypeAdapter<PleromaApiList> {
  @override
  final int typeId = 0;

  @override
  PleromaApiList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiList(
      id: fields[0] as String,
      title: fields[1] as String,
      repliesPolicy: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.repliesPolicy);
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

_$_PleromaApiList _$$_PleromaApiListFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiList(
      id: json['id'] as String,
      title: json['title'] as String,
      repliesPolicy: json['replies_policy'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiListToJson(_$_PleromaApiList instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('replies_policy', instance.repliesPolicy);
  return val;
}
