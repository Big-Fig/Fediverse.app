// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_tag_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiTagMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiTagMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiTagMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiTagMastodonAdapter(
      fields[0] as MastodonApiTag,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiTagMastodonAdapter obj) {
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
      other is UnifediApiTagMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiTagMastodonAdapter _$$_UnifediApiTagMastodonAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiTagMastodonAdapter(
      MastodonApiTag.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiTagMastodonAdapterToJson(
        _$_UnifediApiTagMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
