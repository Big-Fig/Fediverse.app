// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_pagination_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPaginationAdapter extends TypeAdapter<UnifediApiPagination> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPagination read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPagination(
      limit: fields[0] as int?,
      maxId: fields[1] as String?,
      minId: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPagination obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.maxId)
      ..writeByte(2)
      ..write(obj.minId)
      ..writeByte(0)
      ..write(obj.limit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiPaginationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPagination _$$_UnifediApiPaginationFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiPagination(
      limit: json['limit'] as int?,
      maxId: json['max_id'] as String?,
      minId: json['min_id'] as String?,
    );

Map<String, dynamic> _$$_UnifediApiPaginationToJson(
    _$_UnifediApiPagination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('limit', instance.limit);
  writeNotNull('max_id', instance.maxId);
  writeNotNull('min_id', instance.minId);
  return val;
}
