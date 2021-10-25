// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_access_scopes_requirement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiAccessScopesRequirementAdapter
    extends TypeAdapter<MastodonApiAccessScopesRequirement> {
  @override
  final int typeId = 0;

  @override
  MastodonApiAccessScopesRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiAccessScopesRequirement(
      scopesVariants: (fields[0] as List).cast<MastodonApiAccessScopes>(),
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiAccessScopesRequirement obj) {
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
      other is MastodonApiAccessScopesRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiAccessScopesRequirement
    _$$_MastodonApiAccessScopesRequirementFromJson(Map<String, dynamic> json) =>
        _$_MastodonApiAccessScopesRequirement(
          scopesVariants: (json['scopes_variants'] as List<dynamic>)
              .map((e) =>
                  MastodonApiAccessScopes.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_MastodonApiAccessScopesRequirementToJson(
        _$_MastodonApiAccessScopesRequirement instance) =>
    <String, dynamic>{
      'scopes_variants':
          instance.scopesVariants.map((e) => e.toJson()).toList(),
    };
