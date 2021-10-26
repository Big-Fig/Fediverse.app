// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_pagination_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPaginationPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiPaginationPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPaginationPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPaginationPleromaAdapter(
      fields[0] as PleromaApiPagination,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPaginationPleromaAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.valuePagination);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiPaginationPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPaginationPleromaAdapter
    _$$_UnifediApiPaginationPleromaAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiPaginationPleromaAdapter(
          PleromaApiPagination.fromJson(
              json['value_pagination'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPaginationPleromaAdapterToJson(
        _$_UnifediApiPaginationPleromaAdapter instance) =>
    <String, dynamic>{
      'value_pagination': instance.valuePagination.toJson(),
    };
