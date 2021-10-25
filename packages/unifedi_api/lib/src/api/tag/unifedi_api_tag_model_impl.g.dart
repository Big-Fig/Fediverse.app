// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_tag_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiTagAdapter extends TypeAdapter<UnifediApiTag> {
  @override
  final int typeId = 0;

  @override
  UnifediApiTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiTag(
      name: fields[0] as String,
      url: fields[1] as String?,
      history: fields[2] as UnifediApiTagHistory?,
      id: fields[3] as String?,
      lastStatusAt: fields[4] as DateTime?,
      statusesCount: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiTag obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.history)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.lastStatusAt)
      ..writeByte(5)
      ..write(obj.statusesCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiTag _$$_UnifediApiTagFromJson(Map<String, dynamic> json) =>
    _$_UnifediApiTag(
      name: json['name'] as String,
      url: json['url'] as String?,
      history: json['history'] == null
          ? null
          : UnifediApiTagHistory.fromJson(
              json['history'] as Map<String, dynamic>),
      id: json['id'] as String?,
      lastStatusAt: json['last_status_at'] == null
          ? null
          : DateTime.parse(json['last_status_at'] as String),
      statusesCount: json['statuses_count'] as int?,
    );

Map<String, dynamic> _$$_UnifediApiTagToJson(_$_UnifediApiTag instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('history', instance.history?.toJson());
  writeNotNull('id', instance.id);
  writeNotNull('last_status_at', instance.lastStatusAt?.toIso8601String());
  writeNotNull('statuses_count', instance.statusesCount);
  return val;
}
