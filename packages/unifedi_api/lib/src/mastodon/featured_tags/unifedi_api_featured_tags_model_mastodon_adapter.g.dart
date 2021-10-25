// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_featured_tags_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiFeaturedTagMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiFeaturedTagMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiFeaturedTagMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiFeaturedTagMastodonAdapter(
      fields[0] as MastodonApiFeaturedTag,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiFeaturedTagMastodonAdapter obj) {
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
      other is UnifediApiFeaturedTagMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiFeaturedTagMastodonAdapter
    _$$_UnifediApiFeaturedTagMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiFeaturedTagMastodonAdapter(
          MastodonApiFeaturedTag.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiFeaturedTagMastodonAdapterToJson(
        _$_UnifediApiFeaturedTagMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
