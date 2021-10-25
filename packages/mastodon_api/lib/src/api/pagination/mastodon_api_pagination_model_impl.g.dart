// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_pagination_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiPaginationAdapter extends TypeAdapter<MastodonApiPagination> {
  @override
  final int typeId = 0;

  @override
  MastodonApiPagination read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiPagination(
      limit: fields[0] as int?,
      maxId: fields[1] as String?,
      minId: fields[2] as String?,
      sinceId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiPagination obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.maxId)
      ..writeByte(2)
      ..write(obj.minId)
      ..writeByte(3)
      ..write(obj.sinceId)
      ..writeByte(0)
      ..write(obj.limit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiPaginationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiPagination _$$_MastodonApiPaginationFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiPagination(
      limit: json['limit'] as int?,
      maxId: json['max_id'] as String?,
      minId: json['min_id'] as String?,
      sinceId: json['since_id'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiPaginationToJson(
    _$_MastodonApiPagination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('limit', instance.limit);
  writeNotNull('max_id', instance.maxId);
  writeNotNull('min_id', instance.minId);
  writeNotNull('since_id', instance.sinceId);
  return val;
}
