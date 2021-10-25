// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_version_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiVersionMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiVersionMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiVersionMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiVersionMastodonAdapter(
      fields[0] as MastodonApiVersion,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiVersionMastodonAdapter obj) {
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
      other is UnifediApiVersionMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiVersionMastodonAdapter
    _$$_UnifediApiVersionMastodonAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiVersionMastodonAdapter(
          MastodonApiVersion.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiVersionMastodonAdapterToJson(
        _$_UnifediApiVersionMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
