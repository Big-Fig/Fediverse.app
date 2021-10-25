// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fediverse_api_instance_metadata_version_requirement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FediverseApiInstanceMetadataVersionRequirementAdapter
    extends TypeAdapter<FediverseApiInstanceMetadataVersionRequirement> {
  @override
  final int typeId = 0;

  @override
  FediverseApiInstanceMetadataVersionRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FediverseApiInstanceMetadataVersionRequirement(
      versionRange: fields[0] as FediverseApiVersionRange,
    );
  }

  @override
  void write(
      BinaryWriter writer, FediverseApiInstanceMetadataVersionRequirement obj) {
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
      other is FediverseApiInstanceMetadataVersionRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FediverseApiInstanceMetadataVersionRequirement
    _$$_FediverseApiInstanceMetadataVersionRequirementFromJson(
            Map<String, dynamic> json) =>
        _$_FediverseApiInstanceMetadataVersionRequirement(
          versionRange: FediverseApiVersionRange.fromJson(
              json['version_range'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_FediverseApiInstanceMetadataVersionRequirementToJson(
        _$_FediverseApiInstanceMetadataVersionRequirement instance) =>
    <String, dynamic>{
      'version_range': instance.versionRange.toJson(),
    };
