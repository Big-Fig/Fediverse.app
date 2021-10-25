// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_marker_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMarkerAdapter extends TypeAdapter<UnifediApiMarker> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMarker read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMarker(
      lastReadId: fields[0] as String?,
      version: fields[1] as int,
      updatedAt: fields[2] as DateTime?,
      unreadCount: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMarker obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.lastReadId)
      ..writeByte(1)
      ..write(obj.version)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.unreadCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiMarkerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMarker _$$_UnifediApiMarkerFromJson(Map<String, dynamic> json) =>
    _$_UnifediApiMarker(
      lastReadId: json['updated_last_read_id'] as String?,
      version: json['version'] as int,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      unreadCount: json['unread_count'] as int?,
    );

Map<String, dynamic> _$$_UnifediApiMarkerToJson(_$_UnifediApiMarker instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('updated_last_read_id', instance.lastReadId);
  val['version'] = instance.version;
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('unread_count', instance.unreadCount);
  return val;
}
