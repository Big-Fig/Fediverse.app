// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_pagination_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPaginationMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPaginationMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPaginationMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPaginationMastodonAdapter(
      fields[0] as MastodonApiPagination,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPaginationMastodonAdapter obj) {
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
      other is UnifediApiPaginationMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPaginationMastodonAdapter
    _$$_UnifediApiPaginationMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPaginationMastodonAdapter(
          MastodonApiPagination.fromJson(
              json['value_pagination'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPaginationMastodonAdapterToJson(
        _$_UnifediApiPaginationMastodonAdapter instance) =>
    <String, dynamic>{
      'value_pagination': instance.valuePagination.toJson(),
    };
