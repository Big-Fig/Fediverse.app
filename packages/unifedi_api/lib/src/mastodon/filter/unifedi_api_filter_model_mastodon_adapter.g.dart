// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_filter_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiFilterMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiFilterMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiFilterMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiFilterMastodonAdapter(
      fields[0] as MastodonApiFilter,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiFilterMastodonAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiFilterMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiFilterMastodonAdapter _$$_UnifediApiFilterMastodonAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiFilterMastodonAdapter(
      MastodonApiFilter.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiFilterMastodonAdapterToJson(
        _$_UnifediApiFilterMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
