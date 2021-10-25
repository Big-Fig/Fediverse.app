// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_marker_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiMarkerAdapter extends TypeAdapter<MastodonApiMarker> {
  @override
  final int typeId = 0;

  @override
  MastodonApiMarker read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiMarker(
      lastReadId: fields[0] as String?,
      version: fields[1] as int,
      updatedAt: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiMarker obj) {
    writer
      ..writeByte(3)
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
      other is MastodonApiMarkerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiMarker _$$_MastodonApiMarkerFromJson(Map<String, dynamic> json) =>
    _$_MastodonApiMarker(
      lastReadId: json['updated_last_read_id'] as String?,
      version: json['version'] as int,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_MastodonApiMarkerToJson(
    _$_MastodonApiMarker instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('updated_last_read_id', instance.lastReadId);
  val['version'] = instance.version;
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  return val;
}
