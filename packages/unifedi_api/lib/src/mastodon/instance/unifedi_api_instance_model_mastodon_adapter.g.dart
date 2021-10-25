// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceMastodonAdapter(
      fields[0] as MastodonApiInstance,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceMastodonAdapter obj) {
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
      other is UnifediApiInstanceMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceMastodonAdapter
    _$$_UnifediApiInstanceMastodonAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiInstanceMastodonAdapter(
          MastodonApiInstance.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceMastodonAdapterToJson(
        _$_UnifediApiInstanceMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
