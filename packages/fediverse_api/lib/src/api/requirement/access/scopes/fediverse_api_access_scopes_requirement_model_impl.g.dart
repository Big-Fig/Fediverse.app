// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fediverse_api_access_scopes_requirement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FediverseApiAccessScopesRequirementAdapter
    extends TypeAdapter<FediverseApiAccessScopesRequirement> {
  @override
  final int typeId = 0;

  @override
  FediverseApiAccessScopesRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FediverseApiAccessScopesRequirement(
      scopesVariants: (fields[0] as List).cast<FediverseApiAccessScopes>(),
    );
  }

  @override
  void write(BinaryWriter writer, FediverseApiAccessScopesRequirement obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.scopesVariants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FediverseApiAccessScopesRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FediverseApiAccessScopesRequirement
    _$$_FediverseApiAccessScopesRequirementFromJson(
            Map<String, dynamic> json) =>
        _$_FediverseApiAccessScopesRequirement(
          scopesVariants: (json['scopes_variants'] as List<dynamic>)
              .map((e) =>
                  FediverseApiAccessScopes.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_FediverseApiAccessScopesRequirementToJson(
        _$_FediverseApiAccessScopesRequirement instance) =>
    <String, dynamic>{
      'scopes_variants':
          instance.scopesVariants.map((e) => e.toJson()).toList(),
    };
