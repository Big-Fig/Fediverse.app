// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_instance_metadata_version_requirement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiInstanceMetadataVersionRequirementAdapter
    extends TypeAdapter<PleromaApiInstanceMetadataVersionRequirement> {
  @override
  final int typeId = 0;

  @override
  PleromaApiInstanceMetadataVersionRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstanceMetadataVersionRequirement(
      versionRange: fields[0] as PleromaApiVersionRange,
    );
  }

  @override
  void write(
      BinaryWriter writer, PleromaApiInstanceMetadataVersionRequirement obj) {
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
      other is PleromaApiInstanceMetadataVersionRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiInstanceMetadataVersionRequirement
    _$$_PleromaApiInstanceMetadataVersionRequirementFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiInstanceMetadataVersionRequirement(
          versionRange: PleromaApiVersionRange.fromJson(
              json['versionRange'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_PleromaApiInstanceMetadataVersionRequirementToJson(
        _$_PleromaApiInstanceMetadataVersionRequirement instance) =>
    <String, dynamic>{
      'versionRange': instance.versionRange.toJson(),
    };
