// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_instance_metadata_version_requirement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiInstanceMetadataVersionRequirementAdapter
    extends TypeAdapter<MastodonApiInstanceMetadataVersionRequirement> {
  @override
  final int typeId = 0;

  @override
  MastodonApiInstanceMetadataVersionRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiInstanceMetadataVersionRequirement(
      versionRange: fields[0] as MastodonApiVersionRange,
    );
  }

  @override
  void write(
      BinaryWriter writer, MastodonApiInstanceMetadataVersionRequirement obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.versionRange);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiInstanceMetadataVersionRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiInstanceMetadataVersionRequirement
    _$$_MastodonApiInstanceMetadataVersionRequirementFromJson(
            Map<String, dynamic> json) =>
        _$_MastodonApiInstanceMetadataVersionRequirement(
          versionRange: MastodonApiVersionRange.fromJson(
              json['version_range'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_MastodonApiInstanceMetadataVersionRequirementToJson(
        _$_MastodonApiInstanceMetadataVersionRequirement instance) =>
    <String, dynamic>{
      'version_range': instance.versionRange.toJson(),
    };
