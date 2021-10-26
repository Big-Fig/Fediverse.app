// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_feature_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiFeatureAdapter extends TypeAdapter<PleromaApiFeature> {
  @override
  final int typeId = 0;

  @override
  PleromaApiFeature read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiFeature(
      mastodonApiFeature: fields[0] as MastodonApiFeature?,
      accessLevelRequirement: fields[1] as PleromaApiAccessLevelRequirement,
      accessScopesRequirement: fields[2] as PleromaApiAccessScopesRequirement,
      instanceVersionRequirement:
          fields[3] as PleromaApiInstanceMetadataVersionRequirement,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiFeature obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.mastodonApiFeature)
      ..writeByte(1)
      ..write(obj.accessLevelRequirement)
      ..writeByte(2)
      ..write(obj.accessScopesRequirement)
      ..writeByte(3)
      ..write(obj.instanceVersionRequirement);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiFeatureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiFeature _$$_PleromaApiFeatureFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiFeature(
      mastodonApiFeature: json['mastodon_api_feature'] == null
          ? null
          : MastodonApiFeature.fromJson(
              json['mastodon_api_feature'] as Map<String, dynamic>),
      accessLevelRequirement: PleromaApiAccessLevelRequirement.fromJson(
          json['access_level_requirement'] as Map<String, dynamic>),
      accessScopesRequirement: PleromaApiAccessScopesRequirement.fromJson(
          json['access_scope_requirement'] as Map<String, dynamic>),
      instanceVersionRequirement:
          PleromaApiInstanceMetadataVersionRequirement.fromJson(
              json['instance_version_requirement'] as Map<String, dynamic>),
      forceNotImplementedYet: json['force_not_implemented_yet'] as bool?,
    );

Map<String, dynamic> _$$_PleromaApiFeatureToJson(
    _$_PleromaApiFeature instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mastodon_api_feature', instance.mastodonApiFeature?.toJson());
  val['access_level_requirement'] = instance.accessLevelRequirement.toJson();
  val['access_scope_requirement'] = instance.accessScopesRequirement.toJson();
  val['instance_version_requirement'] =
      instance.instanceVersionRequirement.toJson();
  writeNotNull('force_not_implemented_yet', instance.forceNotImplementedYet);
  return val;
}
