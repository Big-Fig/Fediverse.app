// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_marker_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiMarkerAdapter extends TypeAdapter<PleromaApiMarker> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMarker read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMarker(
      lastReadId: fields[0] as String?,
      version: fields[1] as int,
      updatedAt: fields[2] as DateTime?,
      pleroma: fields[3] as PleromaApiMarkerPleromaPart?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMarker obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.pleroma)
      ..writeByte(0)
      ..write(obj.lastReadId)
      ..writeByte(1)
      ..write(obj.version)
      ..writeByte(2)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMarkerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiMarkerPleromaPartAdapter
    extends TypeAdapter<PleromaApiMarkerPleromaPart> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMarkerPleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMarkerPleromaPart(
      unreadCount: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMarkerPleromaPart obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.unreadCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMarkerPleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiMarker _$$_PleromaApiMarkerFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiMarker(
      lastReadId: json['updated_last_read_id'] as String?,
      version: json['version'] as int,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      pleroma: json['pleroma'] == null
          ? null
          : PleromaApiMarkerPleromaPart.fromJson(
              json['pleroma'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiMarkerToJson(_$_PleromaApiMarker instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('updated_last_read_id', instance.lastReadId);
  val['version'] = instance.version;
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('pleroma', instance.pleroma?.toJson());
  return val;
}

_$_PleromaApiMarkerPleromaPart _$$_PleromaApiMarkerPleromaPartFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiMarkerPleromaPart(
      unreadCount: json['unread_count'] as int?,
    );

Map<String, dynamic> _$$_PleromaApiMarkerPleromaPartToJson(
    _$_PleromaApiMarkerPleromaPart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unread_count', instance.unreadCount);
  return val;
}
