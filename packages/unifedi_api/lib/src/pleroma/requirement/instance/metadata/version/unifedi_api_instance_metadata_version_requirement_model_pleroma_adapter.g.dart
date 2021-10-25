// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_metadata_version_requirement_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceMetadataVersionRequirementPleromaAdapterAdapter
    extends TypeAdapter<
        UnifediApiInstanceMetadataVersionRequirementPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceMetadataVersionRequirementPleromaAdapter read(
      BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceMetadataVersionRequirementPleromaAdapter(
      fields[0] as PleromaApiInstanceMetadataVersionRequirement,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiInstanceMetadataVersionRequirementPleromaAdapter obj) {
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
      other is UnifediApiInstanceMetadataVersionRequirementPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceMetadataVersionRequirementPleromaAdapter
    _$$_UnifediApiInstanceMetadataVersionRequirementPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceMetadataVersionRequirementPleromaAdapter(
          PleromaApiInstanceMetadataVersionRequirement.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$_UnifediApiInstanceMetadataVersionRequirementPleromaAdapterToJson(
            _$_UnifediApiInstanceMetadataVersionRequirementPleromaAdapter
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
        };
