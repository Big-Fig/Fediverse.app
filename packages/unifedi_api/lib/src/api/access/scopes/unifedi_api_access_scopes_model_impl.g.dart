// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_scopes_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessScopesAdapter
    extends TypeAdapter<UnifediApiAccessScopes> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessScopes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessScopes(
      globalPermissions: (fields[0] as List).cast<String>(),
      targetPermissions: (fields[1] as List).cast<UnifediApiAccessScopesItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessScopes obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.targetPermissions)
      ..writeByte(0)
      ..write(obj.globalPermissions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAccessScopesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessScopes _$$_UnifediApiAccessScopesFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAccessScopes(
      globalPermissions: (json['global_permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      targetPermissions: (json['target_permissions'] as List<dynamic>)
          .map((e) =>
              UnifediApiAccessScopesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnifediApiAccessScopesToJson(
        _$_UnifediApiAccessScopes instance) =>
    <String, dynamic>{
      'global_permissions': instance.globalPermissions,
      'target_permissions':
          instance.targetPermissions.map((e) => e.toJson()).toList(),
    };
