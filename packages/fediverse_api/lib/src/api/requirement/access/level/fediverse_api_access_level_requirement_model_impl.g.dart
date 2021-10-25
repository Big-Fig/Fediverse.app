// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fediverse_api_access_level_requirement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FediverseApiAccessLevelRequirementAdapter
    extends TypeAdapter<FediverseApiAccessLevelRequirement> {
  @override
  final int typeId = 0;

  @override
  FediverseApiAccessLevelRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FediverseApiAccessLevelRequirement(
      requiredLevel: fields[0] as FediverseApiAccessLevel,
    );
  }

  @override
  void write(BinaryWriter writer, FediverseApiAccessLevelRequirement obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.requiredLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FediverseApiAccessLevelRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FediverseApiAccessLevelRequirement
    _$$_FediverseApiAccessLevelRequirementFromJson(Map<String, dynamic> json) =>
        _$_FediverseApiAccessLevelRequirement(
          requiredLevel: FediverseApiAccessLevel.fromJson(
              json['requiredLevel'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_FediverseApiAccessLevelRequirementToJson(
        _$_FediverseApiAccessLevelRequirement instance) =>
    <String, dynamic>{
      'requiredLevel': instance.requiredLevel.toJson(),
    };
