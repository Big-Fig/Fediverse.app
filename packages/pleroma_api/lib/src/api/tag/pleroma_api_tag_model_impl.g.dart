// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_tag_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiTagAdapter extends TypeAdapter<PleromaApiTag> {
  @override
  final int typeId = 0;

  @override
  PleromaApiTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiTag(
      name: fields[0] as String,
      url: fields[1] as String,
      history: (fields[2] as List?)?.cast<PleromaApiTagHistoryItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiTag obj) {
    writer
      ..writeByte(3)
      ..writeByte(2)
      ..write(obj.history)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiTag _$$_PleromaApiTagFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiTag(
      name: json['name'] as String,
      url: json['url'] as String,
      history: (json['history'] as List<dynamic>?)
          ?.map((e) =>
              PleromaApiTagHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PleromaApiTagToJson(_$_PleromaApiTag instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('history', instance.history?.map((e) => e.toJson()).toList());
  return val;
}
