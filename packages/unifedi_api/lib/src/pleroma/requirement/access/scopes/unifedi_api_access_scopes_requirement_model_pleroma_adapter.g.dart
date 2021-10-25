// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_scopes_requirement_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessScopesRequirementPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccessScopesRequirementPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessScopesRequirementPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessScopesRequirementPleromaAdapter(
      fields[0] as PleromaApiAccessScopesRequirement,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiAccessScopesRequirementPleromaAdapter obj) {
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
      other is UnifediApiAccessScopesRequirementPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessScopesRequirementPleromaAdapter
    _$$_UnifediApiAccessScopesRequirementPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessScopesRequirementPleromaAdapter(
          PleromaApiAccessScopesRequirement.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessScopesRequirementPleromaAdapterToJson(
        _$_UnifediApiAccessScopesRequirementPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
