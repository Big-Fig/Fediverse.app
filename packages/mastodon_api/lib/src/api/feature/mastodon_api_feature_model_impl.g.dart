// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_feature_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiFeatureAdapter extends TypeAdapter<MastodonApiFeature> {
  @override
  final int typeId = 0;

  @override
  MastodonApiFeature read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiFeature(
      accessLevelRequirement: fields[0] as MastodonApiAccessLevelRequirement,
      accessScopesRequirement: fields[1] as MastodonApiAccessScopesRequirement,
      instanceVersionRequirement:
          fields[2] as MastodonApiInstanceMetadataVersionRequirement,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiFeature obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.accessLevelRequirement)
      ..writeByte(1)
      ..write(obj.accessScopesRequirement)
      ..writeByte(2)
      ..write(obj.instanceVersionRequirement);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiFeatureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiFeature _$$_MastodonApiFeatureFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiFeature(
      accessLevelRequirement: MastodonApiAccessLevelRequirement.fromJson(
          json['access_level_requirement'] as Map<String, dynamic>),
      accessScopesRequirement: MastodonApiAccessScopesRequirement.fromJson(
          json['access_scopes_requirement'] as Map<String, dynamic>),
      instanceVersionRequirement:
          MastodonApiInstanceMetadataVersionRequirement.fromJson(
              json['instance_version_requirement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MastodonApiFeatureToJson(
        _$_MastodonApiFeature instance) =>
    <String, dynamic>{
      'access_level_requirement': instance.accessLevelRequirement.toJson(),
      'access_scopes_requirement': instance.accessScopesRequirement.toJson(),
      'instance_version_requirement':
          instance.instanceVersionRequirement.toJson(),
    };
