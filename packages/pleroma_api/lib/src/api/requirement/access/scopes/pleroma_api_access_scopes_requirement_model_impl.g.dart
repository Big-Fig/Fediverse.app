// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_access_scopes_requirement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccessScopesRequirementAdapter
    extends TypeAdapter<PleromaApiAccessScopesRequirement> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccessScopesRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccessScopesRequirement(
      scopesVariants: (fields[0] as List).cast<PleromaApiAccessScopes>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccessScopesRequirement obj) {
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
      other is PleromaApiAccessScopesRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccessScopesRequirement
    _$$_PleromaApiAccessScopesRequirementFromJson(Map<String, dynamic> json) =>
        _$_PleromaApiAccessScopesRequirement(
          scopesVariants: (json['scopes_variants'] as List<dynamic>)
              .map((e) =>
                  PleromaApiAccessScopes.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_PleromaApiAccessScopesRequirementToJson(
        _$_PleromaApiAccessScopesRequirement instance) =>
    <String, dynamic>{
      'scopes_variants':
          instance.scopesVariants.map((e) => e.toJson()).toList(),
    };
