// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_access_scopes_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiAccessScopesAdapter
    extends TypeAdapter<MastodonApiAccessScopes> {
  @override
  final int typeId = 0;

  @override
  MastodonApiAccessScopes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiAccessScopes(
      globalPermissions: (fields[0] as List).cast<String>(),
      targetPermissions:
          (fields[1] as List).cast<MastodonApiAccessScopesItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiAccessScopes obj) {
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
      other is MastodonApiAccessScopesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiAccessScopes _$$_MastodonApiAccessScopesFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiAccessScopes(
      globalPermissions: (json['global_permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      targetPermissions: (json['target_permissions'] as List<dynamic>)
          .map((e) =>
              MastodonApiAccessScopesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MastodonApiAccessScopesToJson(
        _$_MastodonApiAccessScopes instance) =>
    <String, dynamic>{
      'global_permissions': instance.globalPermissions,
      'target_permissions':
          instance.targetPermissions.map((e) => e.toJson()).toList(),
    };
