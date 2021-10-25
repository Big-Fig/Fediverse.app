// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_access_level_requirement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccessLevelRequirementAdapter
    extends TypeAdapter<PleromaApiAccessLevelRequirement> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccessLevelRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccessLevelRequirement(
      requiredLevel: fields[0] as PleromaApiAccessLevel,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccessLevelRequirement obj) {
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
      other is PleromaApiAccessLevelRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccessLevelRequirement
    _$$_PleromaApiAccessLevelRequirementFromJson(Map<String, dynamic> json) =>
        _$_PleromaApiAccessLevelRequirement(
          requiredLevel: PleromaApiAccessLevel.fromJson(
              json['requiredLevel'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_PleromaApiAccessLevelRequirementToJson(
        _$_PleromaApiAccessLevelRequirement instance) =>
    <String, dynamic>{
      'requiredLevel': instance.requiredLevel.toJson(),
    };
