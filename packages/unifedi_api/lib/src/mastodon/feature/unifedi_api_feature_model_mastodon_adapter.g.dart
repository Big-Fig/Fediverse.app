// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_feature_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiFeatureMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiFeatureMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiFeatureMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiFeatureMastodonAdapter(
      fields[0] as MastodonApiFeature,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiFeatureMastodonAdapter obj) {
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
      other is UnifediApiFeatureMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiFeatureMastodonAdapter
    _$$_UnifediApiFeatureMastodonAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiFeatureMastodonAdapter(
          MastodonApiFeature.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiFeatureMastodonAdapterToJson(
        _$_UnifediApiFeatureMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
