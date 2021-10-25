// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_level_requirement_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessLevelRequirementPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccessLevelRequirementPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessLevelRequirementPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessLevelRequirementPleromaAdapter(
      fields[0] as PleromaApiAccessLevelRequirement,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccessLevelRequirementPleromaAdapter obj) {
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
      other is UnifediApiAccessLevelRequirementPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessLevelRequirementPleromaAdapter
    _$$_UnifediApiAccessLevelRequirementPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessLevelRequirementPleromaAdapter(
          PleromaApiAccessLevelRequirement.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessLevelRequirementPleromaAdapterToJson(
        _$_UnifediApiAccessLevelRequirementPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
