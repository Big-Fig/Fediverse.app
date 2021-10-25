// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fediverse_api_access_scopes_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FediverseApiAccessScopesAdapter
    extends TypeAdapter<FediverseApiAccessScopes> {
  @override
  final int typeId = 0;

  @override
  FediverseApiAccessScopes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FediverseApiAccessScopes(
      globalPermissions: (fields[0] as List).cast<String>(),
      targetPermissions:
          (fields[1] as List).cast<FediverseApiAccessScopesItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, FediverseApiAccessScopes obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.globalPermissions)
      ..writeByte(1)
      ..write(obj.targetPermissions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FediverseApiAccessScopesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FediverseApiAccessScopes _$$_FediverseApiAccessScopesFromJson(
        Map<String, dynamic> json) =>
    _$_FediverseApiAccessScopes(
      globalPermissions: (json['global_permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      targetPermissions: (json['target_permissions'] as List<dynamic>)
          .map((e) =>
              FediverseApiAccessScopesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FediverseApiAccessScopesToJson(
        _$_FediverseApiAccessScopes instance) =>
    <String, dynamic>{
      'global_permissions': instance.globalPermissions,
      'target_permissions':
          instance.targetPermissions.map((e) => e.toJson()).toList(),
    };
